From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH] platform: x86: hp_wireless: Inform the user if
 hp_wireless_input_setup()/add() fails
Date: Mon, 1 Dec 2014 15:22:45 +0800
Message-ID: <CAJ=jqubXzyP+4S7Hp3Sp6WvjLuSvCMLJoWqmL2Qz-5zgsr+9Uw@mail.gmail.com>
References: <1417212867-25187-1-git-send-email-giedriuswork@gmail.com>
	<20141128231555.GA31468@pd.tnic>
	<547909CF.8060907@gmail.com>
	<20141129000417.GG30997@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qg0-f50.google.com ([209.85.192.50]:36031 "EHLO
	mail-qg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752598AbaLAHWq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 1 Dec 2014 02:22:46 -0500
Received: by mail-qg0-f50.google.com with SMTP id i50so7022008qgf.23
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Nov 2014 23:22:45 -0800 (PST)
In-Reply-To: <20141129000417.GG30997@pd.tnic>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Giedrius Statkevicius <giedriuswork@gmail.com>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org

Hi,

I think adding a pr_err message has a benefit - if kernel prints this
message, a develop can quickly identify where it gets wrong by a
string search on entire kernel source code.

Other than this, both solutions are great.



On Sat, Nov 29, 2014 at 8:04 AM, Borislav Petkov <bp@alien8.de> wrote:
> On Sat, Nov 29, 2014 at 01:48:31AM +0200, Giedrius Statkevicius wrote:
>> On 2014.11.29 01:15, Borislav Petkov wrote:
>> > On Sat, Nov 29, 2014 at 12:14:27AM +0200, Giedrius Statkevicius wrote:
>> >> In hpwl_add() there is a unused variable err to which we assign the
>> >> result of hp_wireless_input_setup() but we don't do anything depending
>> >> on the result so print out a message that informs the user if add()
>> >> (hp_wireless_input_setup()) fails since acpi_device_probe() doesn't
>> >> print anything in this case.
>> >>
>> >> Signed-off-by: Giedrius Statkevicius <giedriuswork@gmail.com>
>> >> ---
>> >>  drivers/platform/x86/hp-wireless.c | 3 +++
>> >>  1 file changed, 3 insertions(+)
>> >>
>> >> diff --git a/drivers/platform/x86/hp-wireless.c b/drivers/platform/x86/hp-wireless.c
>> >> index 415348f..4e4cc8b 100644
>> >> --- a/drivers/platform/x86/hp-wireless.c
>> >> +++ b/drivers/platform/x86/hp-wireless.c
>> >> @@ -85,6 +85,9 @@ static int hpwl_add(struct acpi_device *device)
>> >>    int err;
>> >>
>> >>    err = hp_wireless_input_setup();
>> >> +  if (err)
>> >> +          pr_err("Failed to setup hp wireless hotkeys\n");
>> >> +
>> >
>> > I don't think there's need for that. Just do:
>> >
>> >     return hp_wireless_input_setup();
>> >
>> > and drop err completely.
>> >
>> > The upper layer which calls the ->add() method should propagate the
>> > error properly.
>> Looking at other platform drivers code some add() methods do give
>> information to the user via pr_{err,warn,info} macros, some don't. My
>> first patch to deal with this just removed the err variable like you
>> have wrote but Darren Hart and Rafael J. Wysocki commented that maybe it
>> should be better to inform the user about this error. That is why
>> probably there was a variable for this in the first place but probably
>> the original author just forgot to add a pr_err().
>
> Ah, I see. Original author added to CC.
>
> --
> Regards/Gruss,
>     Boris.
>
> Sent from a fat crate under my desk. Formatting is fine.
> --



-- 
Cheers,
Alex Hung
