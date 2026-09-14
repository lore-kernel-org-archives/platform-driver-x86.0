Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE38F258EF9;
	Mon, 14 Sep 2026 12:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389664; cv=none; b=oyLAvF0A+Kq9++iHus5z7i/zBRkv34MD+l4A+K1DK5vfTBEcKjUearM3tz1rh3z0/Day1sTtTpa51KYy/TDfJMUuJMe6SVRme8c6hAHxBDEFWqI9kMsyRvGoRZvFnUZczaqoSKBqPDxewixa7M2NHFc9xnaC87S7jmy+oJ1KhfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389664; c=relaxed/simple;
	bh=5vV1fvoA6kAHgh2q5Cl/thwnhZvOQ3BBUsh6SWjy6bM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L9wd1+4fbBucctZEi1WxlCMPNcBTzCyzVOZWNzjLGt6xItRsrcYUToQwoZVfK8D3lUA95ii4JtKyFzgRhmL5Ic5ioq7Akk6oOel0H56/rOHsSMqmLB+Gljn63Hyvq0HIy5v/y+7iSw+6Nh6kKcQgXlf68tykmbGYcmCdeMdTo0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwbZyQfJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwbZyQfJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2CB1F000FF;
	Mon, 14 Sep 2026 12:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789389662;
	bh=TsiixbUIFRIpiu/LESOIf6uIWt8c+irRdgfE+CUiC6k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QwbZyQfJGSeLfclg5XejqxKsJpQu40BoHa5FMLo5R6Cy0gbh4kAduhvJLIE/t/KIo
	 A7ityOvzDt/gXjAdSX528GLd3Vmjp34UK6vlFGhwGPNpik7PYr/YqDJjCKD6h0cqT6
	 mQaEDqC0xrYeKUbqvb4pc11muG/8yeiswR8qcsiEFS1s47YQEOZKdn4LUdVAzLJUyc
	 dwnBt/85jwdczzzrecRMlsPDNUGoXlXnxz1HYxGdvKZb1YZ1jvQohufmn/8mXbXFbX
	 sDIdgngl53odeyduQHgjmEenACF0CERs4yXeNKx/lVN1K2QT9R7wfGoAFsS3HQxuDU
	 Q8giT1GSPpyKg==
Message-ID: <2eab84cb-6d2f-4ec3-9869-e2aa9c1d75da@kernel.org>
Date: Mon, 14 Sep 2026 14:40:58 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add Yoga Pro 7 14IAH10 Mode
 key
To: Navon John Lukose <navonjohnlukose@gmail.com>, ikepanhc@gmail.com,
 ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260913224753.30281-1-navonjohnlukose@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260913224753.30281-1-navonjohnlukose@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Navon,

On 14-Sep-26 12:47 AM, Navon John Lukose wrote:
> The F9 "Mode" key emits WMI fn-key event 0x46, which the keymap does not
> cover, so it reaches userspace as KEY_UNKNOWN and cannot be remapped from
> there. Under Windows it opens a performance profile chooser, so it belongs
> in the keymap as a user-assignable key. Map it to KEY_PROG4.
> 
> Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
> ---
> Lenovo Yoga Pro 7 14IAH10 (83KF), BIOS QGCN35WW. No other key on this
> machine emits 0x46, and pressing the Mode key leaves platform_profile
> unchanged.
> 
> KEY_PROG4 per Hans's note on the 0x3d key, that a key opening a settings
> dialog under Windows should get a free KEY_PROG#:
> https://lore.kernel.org/platform-driver-x86/35969669-48b6-469e-9cd2-26929fb33e5f@redhat.com/

As the comment on the KE_KEY entry above the one you add says, this should
really be handled specially inside ideapad_wmi_notify(). IIRC we still want
the KE_KEY entry to emit a key-press on laptops without DYTC platform-profile
support.

For laptops with DYTC support you want to modify this bit in ideapad_wmi_notify():

                /* performance button triggered by 0x3d */
                if (data->integer.value == 0x3d && priv->dytc) {
                        platform_profile_cycle();
                        break;
                }

to also trigger on the new 0x46 code:

                /* performance button triggered by 0x3d or 0x46 */
                if ((data->integer.value == 0x3d || data->integer.value == 0x46) && priv->dytc) {
                        platform_profile_cycle();
                        break;
                }

So that this key actually toggles through the different (power-save/balanced/performanc)
platform profiles the laptop has.

Unless there already is another key to do that ?

And please also add a comment to the new KE_KEY entry that this is handled inside
ideapad_wmi_notify() like the existing KE_KEY entry for 0x3d has.

Hmm, I see you say that under Windows this opens a performance menu rather
then outright toggle the profile. So I guess that you maybe also have Fn + Q or
something which already directly switches profile ?  If you do then KEY_PROG4
seems fine. If you do not I think just cycling the profile would be better,
what do you think ?

Regards,

Hans


> 
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
> index 8213524..6fa72a3 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -1360,6 +1360,8 @@ static const struct key_entry ideapad_keymap[] = {
>  	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
>  	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
>  	{ KE_KEY,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
> +	/* Mode (performance profile chooser) */
> +	{ KE_KEY,	0x46 | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
>  	/* shift + prtsc */
>  	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
>  	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
> 
> base-commit: 22098763a10d9c13

