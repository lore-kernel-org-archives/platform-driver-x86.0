Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7C928033B;
	Mon, 10 Aug 2026 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368704; cv=none; b=R0vowesM680oKyIUGhDci09qoIeY70NjoxdnD+khQ/EeQ8kIdQboUoh3vlpEheZI0T35OOqAqwGQfBjACDrFBveUvWCmZyDWsUnd2BkMsJGc6E0TDMAFdy+Ihz64Qdasl/6xdfNBrGR+QVnfq8Jg3ka8TENbO/4YgMQdwBPt77k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368704; c=relaxed/simple;
	bh=Qcws4cFwyNqXsXVVmW2aoSuRFOEEYj0NrVYoHiqA6FI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FBTKgKl6pbVZI3WVdLcM528tS2JlwnjQaZsHx+iGQNjqmGBwt2HeP2JJv7VgoOHGgtgTSC1JV0NHekYCB4roBi3B2fGpOOJycFSCA6u7RxmVHP+u79OrQo9IRFpbMyxVdFANpPANvjIYlR2EV/jp761HUXR2WOniTE0XubAL2no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkAHtu5F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkAHtu5F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1791F000E9;
	Mon, 10 Aug 2026 13:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786368702;
	bh=jofVDHyCDmmGuhYIq1yXWJDWlKE6UWuDTaXepD1Etko=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nkAHtu5FV3qbPvuFrMvqF54Wmfhcr+xiLYllivD82fxsY7JB2M4AUQxUZIiXJn39C
	 XoomtcLCbV7oXrPjAxJMFb6wOqqh7w9hRVNCohaS0tCxcK82/xldcE+VSxU9Eo+deP
	 eNqlu5lTROzVQX119GQL22leEzJH9Ti9+Hl0hI8D6MtgTWwNavlnebdYcoU8vWfjXY
	 QNCxsBYPmgudc3TRpwE1yO/ZPrtYqsaXXUfelAQMGeZM38G5/pky1YU9Dt29ZzBEWl
	 kDOWWCFX9YgacjFozTfyb9MpPYM7RIgCiiyaiw89DGvaQzps1Sa8iIYzSmlQt0Pz+m
	 tDi0unrV2A82g==
Message-ID: <04ad30f5-05b4-4a79-b872-2312543ab032@kernel.org>
Date: Mon, 10 Aug 2026 15:31:39 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86: asus-wmi: keep the lid-flip state
 when UNKNOWN is set
To: Robin Everaars <robineveraars@pm.me>, ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260805101502.235668-1-robineveraars@pm.me>
 <20260805141114.699959-1-robineveraars@pm.me>
 <20260805141114.699959-2-robineveraars@pm.me>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260805141114.699959-2-robineveraars@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Thank you for your patches!

On 5-Aug-26 4:11 PM, Robin Everaars wrote:
> On some convertibles the lid-flip devstate sets ASUS_WMI_DSTS_UNKNOWN_BIT
> alongside the state bit while the machine is folded. Measured on an ASUS
> ProArt PX13 (HN7306EAC), ASUS_WMI_DEVID_LID_FLIP_ROG answers 0x00010000
> open and 0x00010003 folded, that is presence | status | UNKNOWN.
> 
> asus_wmi_get_devstate_simple() treats that bit as "the state is not known"
> and fails the call with -ENODEV, so asus_wmi_tablet_mode_get_state()
> discards a perfectly good state sitting in bit 0 and SW_TABLET_MODE never
> moves.
> 
> Add asus_wmi_tablet_sw_get_state(), which gates on the presence bit only
> and returns the status bit. Use it from the two tablet-switch paths. Every
> other caller of asus_wmi_get_devstate_simple() is untouched, so the change
> is confined to the tablet switch.
> 
> Signed-off-by: Robin Everaars <robineveraars@pm.me>
> ---
> v2: use FIELD_GET() for both bits and add the linux/bitfield.h include,
>     per Denis Benato. Drops the !! on the return. No functional change.
> 
>  drivers/p
> latform/x86/asus-wmi.c | 33 +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 8610663..dce4d07 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -15,6 +15,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/backlight.h>
> +#include <linux/bitfield.h>
>  #include <linux/bits.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
> @@ -706,12 +707,40 @@ static void asus_wmi_tablet_sw_report(struct asus_wmi *asus, bool value)
>  	input_sync(asus->inputdev);
>  }
>  
> +/*
> + * Read the lid-flip state directly rather than through
> + * asus_wmi_get_devstate_simple().
> + *
> + * On some convertibles the lid-flip devstate sets ASUS_WMI_DSTS_UNKNOWN_BIT
> + * alongside the state bit while folded. Measured on an ASUS ProArt PX13
> + * (HN7306EAC), devid ASUS_WMI_DEVID_LID_FLIP_ROG answers 0x00010000 open and
> + * 0x00010003 folded, i.e. pre
> sence | state | UNKNOWN. The generic helper reads
> + * that bit as "the state is not known" and rejects the whole call with -ENODEV,
> + * so asus_wmi_tablet_mode_get_state() discards a perfectly good state sitting in
> + * bit 0 and the switch never moves. Only presence gates the value here, which is
> + * safe because this path serves the tablet switch alone.
> + */
> +static int asus_wmi_tablet_sw_get_state(struct asus_wmi *asus, u32 dev_id)
> +{
> +	u32 retval;
> +	int err;
> +
> +	err = asus_wmi_get_devstate(asus, dev_id, &retval);
> +	if (err < 0)
> +		return err;
> +
> +	if (!FIELD_GET(ASUS_WMI_DSTS_PRESENCE_BIT, retval))
> +		return -ENODEV;
> +
> +	return FIELD_GET(ASUS_WMI_DSTS_STATUS_BIT, retval);
> +}
> +

Looking at the existing asus_wmi_get_devstate_bits() code (which
asus_wmi_get_devstate_simple() wraps), the special handling of
ASUS_WMI_DSTS_UNKNOWN_BIT is gated behind mask == ASUS_WMI_DSTS_STATUS_BIT.

And the only caller of asus_wmi_get_devstate_bits() with a mask of
ASUS_WMI_DSTS_STATUS_BIT is asus_wmi_get_devstate_simple().

So IMHO rather then introducing a new function, the special handling of
ASUS_WMI_DSTS_UNKNOWN_BIT should be removed from asus_wmi_get_devstate_bits()
and then added to asus_wmi_get_devstate_simple() changing the latter to e.g. :

static int asus_wmi_get_devstate_simple(struct asus_wmi *asus, u32 dev_id)
{
        int ret;

        ret = asus_wmi_get_devstate_bits(asus, dev_id,
                        ASUS_WMI_DSTS_STATUS_BIT | ASUS_WMI_DSTS_UNKNOWN_BIT);
        if (ret < 0)
                return ret;
        if (ret & ASUS_WMI_DSTS_UNKNOWN_BIT)
                return -ENODEV;

        return ret;
}

and then the 2 asus_wmi_get_devstate_simple(asus, asus->tablet_switch_dev_id)
calls can be replaced with:

	result = asus_wmi_get_devstate_bits(asus, dev_id, ASUS_WMI_DSTS_STATUS_BIT);

without needing to introduce a new special helper.

Regards,

Hans






>  static void asus_wmi_tablet_sw_init(struct asus_wmi *asus, u32 dev_id, int event_code)
>  {
>  	struct device *dev = &asus->platform_device->dev;
>  	int result;
>  
> -	result = asus_wmi_get_devstate_simple(asus, dev_id);
> +	result = asus_wmi_tablet_sw_get_state(asus, dev_id);
>  	if (result >=
>  0) {
>  		input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
>  		asus_wmi_tablet_sw_report(asus, result);
> @@ -786,7 +815,7 @@ static void asus_wmi_tablet_mode_get_state(struct asus_wmi *asus)
>  	if (!asus->tablet_switch_dev_id)
>  		return;
>  
> -	result = asus_wmi_get_devstate_simple(asus, asus->tablet_switch_dev_id);
> +	result = asus_wmi_tablet_sw_get_state(asus, asus->tablet_switch_dev_id);
>  	if (result >= 0)
>  		asus_wmi_tablet_sw_report(asus, result);
>  }

