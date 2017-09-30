From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 3/8] platform/x86: dell-wmi-smbios: Use Dell WMI
 descriptor check
Date: Fri, 29 Sep 2017 18:29:12 -0700
Message-ID: <20170930012912.GB13307@fury>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <bea602b33e27facc77ee850ef14dfa37f6894275.1506571188.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bea602b33e27facc77ee850ef14dfa37f6894275.1506571188.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 27, 2017 at 11:02:15PM -0500, Mario Limonciello wrote:
> The Dell WMI descriptor check is used as an indication that WMI
> calls are safe to run both when used with the notification
> ASL/GUID pair as well as the SMBIOS calling ASL/GUID pair.
> 
> As some code in dell-wmi-smbios is already a prerequisite for
> dell-wmi, move the code for performing the descriptor check into
> dell-wmi-smbios and let both drivers use it from there.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
...
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
...
>  
> +/*
> + * Descriptor buffer is 128 byte long and contains:
...
> +	if (obj->buffer.length != 128) {
> +		dev_err(&wdev->dev,
> +			"Dell descriptor buffer has invalid length (%d)\n",
> +			obj->buffer.length);

This seems odd. We call it an error (not a warning) if != 128, but we only abort
and return an error if it's < 16.

If it's an error, we should return an error code, if anything above 16 is
acceptable but 128 is preferred, the above should be a warning at best. (this
scenario seems unlikely).

> +		if (obj->buffer.length < 16) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +	}
> +	desc_buffer = (u32 *)obj->buffer.pointer;
> +
> +	if (desc_buffer[0] != 0x4C4C4544 && desc_buffer[1] != 0x494D5720)

This seems like it should be an || ?

(I see this is fixed in a later patch)

I would have suggested fixing it, then moving it - just from a pure ease of
review perspective. Perhaps not in the comment above that this is a verbatim
move, some fixes are coming in subsequent patches. This is worth noting for a
future develop who may be choosing what to backport.

>  static int dell_smbios_wmi_probe(struct wmi_device *wdev)
>  {
> +	int ret;
> +	u32 interface_version;

Declarations in order of decreasing line length please.

> @@ -236,6 +316,7 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev)
>  	if (!buffer)
>  		return -ENOMEM;
>  	bufferlen = sizeof(struct wmi_calling_interface_buffer);
> +

Stray whitespace, should have been in the previous patch I guess?


-- 
Darren Hart
VMware Open Source Technology Center
