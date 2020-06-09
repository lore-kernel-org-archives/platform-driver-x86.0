From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH v3 3/3] platform/x86: dell-wmi: add new dmi mapping for
 keycode 0xffff
Date: Tue, 9 Jun 2020 11:19:52 +0200
Message-ID: <20200609091952.myqtorlp42aiqpup@pali>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <cover.1591673143.git.y.linux@paritcher.com>
 <e2f6b5ee27a3a6142a2f8806be8dfbce442548da.1591673143.git.y.linux@paritcher.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e2f6b5ee27a3a6142a2f8806be8dfbce442548da.1591673143.git.y.linux@paritcher.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Y Paritcher <y.linux@paritcher.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Mario.Limonciello@dell.com
List-Id: platform-driver-x86.vger.kernel.org

Adding Darren and Andy, please look at this issue as this is something
which should be decided how to handle in all platform/wmi drivers.

On Monday 08 June 2020 23:52:54 Y Paritcher wrote:
> This looks to be a special value for some sort of custom scancode.
> This code could not be triggered for any keypress and is included
> from the 0xB2 DMI table.
> 
> This prevents the following messages from being logged at startup on a
> Dell Inspiron 5593:
> 
>     dell_wmi: firmware scancode 0x48 maps to unrecognized keycode 0xffff
>     dell_wmi: firmware scancode 0x50 maps to unrecognized keycode 0xffff
> 
> as per this code comment:
> 
>    Log if we find an entry in the DMI table that we don't
>    understand.  If this happens, we should figure out what
>    the entry means and add it to bios_to_linux_keycode.
> 
> Signed-off-by: Y Paritcher <y.linux@paritcher.com>
> ---
>  drivers/platform/x86/dell-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index e3bc2601e631..bbdb3e860892 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -506,7 +506,7 @@ static void handle_dmi_entry(const struct dmi_header *dm, void *opaque)
>  		u16 keycode = (bios_entry->keycode <
>  			       ARRAY_SIZE(bios_to_linux_keycode)) ?
>  			bios_to_linux_keycode[bios_entry->keycode] :
> -			KEY_RESERVED;
> +			(bios_entry->keycode == 0xffff ? KEY_UNKNOWN : KEY_RESERVED);

I really do not like this patch in this form as it is inconsistent with
how are these key codes processed. And also because it does not solve
any problem. It just hides existence of the problem. And this is
something which should be avoided as it makes debugging harder and
basically does not bring any value.

To explain it a bit more. We have mapping table bios_to_linux_keycode[]
from Dell BIOS key codes to Linux key codes. This mapping table is used
for processing Dell WMI buffer of type 0x0010.

You are not able to trigger these events and therefore you and nobody
else in this discussion does not know yet what real key triggers this
Dell BIOS key code.

So it means that you are proposing to add "bogus" value into
bios_to_linux_keycode[] table (just implicitly via check to reduce
memory usage, but it does not matter) just because to hide existence of
the problem.

This bogus value "KEY_UNKNOWN" is there just as a placeholder because
nobody know correct value and nobody was able to trigger it.

Also how it differs situation with unknown keycode "39" which is also
missing in the table from yours with keycode "65535" which is also
missing in the table?

I think there is no difference, for both values we do not know what is
correct mapping to Linux keycodes and therefore value is not present in
bios_to_linux_keycode[] table.

If I accept to take this bogus value for keycode "65535", tomorrow can
somebody send me a patch which adds bogus value "1000" for the same
reason as you as it makes precedense. But it also does not solve any
problem.

We would just end up with mess and garbage in bios_to_linux_keycode[]
mapping table together with some correct values in table.

So we should ask here two main questions:

1) Is dell-wmi able to process key presses (or events) with scancode
0x48 and keycode 0xffff?

2) If we are not able to process them, what should we do?

Answer for first question is definitely "no".

And answer for second question, I'm not sure, but I thought that
throwing warning or info message is the correct solution. Driver cannot
handle something, so it inform about it, instead of silently dropping
event. Same behavior I'm seeing in other kernel drivers.

But looks like that you and Mario have opposite opinion, that kernel
should not log unknown events and rather should drop them.

I would like to have behavior of dell-wmi same as in other drivers for
consistency, so the best would be to ask WMI/platform maintainers. They
could have opinion how to handle these problem globally.

...

Darren & Andy, could you please say something to this, what do you think
about silently dropping events/actions which are currently unknown for
dell-wmi driver? It is better to log them or not? Currently we are
logging them.

>  
>  		/*
>  		 * Log if we find an entry in the DMI table that we don't
> -- 
> 2.27.0
> 
