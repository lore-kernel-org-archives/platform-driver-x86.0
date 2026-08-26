Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7E83B895A;
	Wed, 26 Aug 2026 08:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787732883; cv=none; b=UG0aQY+vk3PHWSUO2cOrvMCeuaRRqbiX2gveMJlTQa+8M4Ns6JjEcRZfj+9VXYXuMDBkt4IoWNS6lAep1tIITbCpG8n4RGw0Pe2Ni+wydLgOVKaD8/SqnU4PBsvr9YETxDCrV6GF6iAt5GE05cfWCmoRmTfPA44jtakhDBb7QSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787732883; c=relaxed/simple;
	bh=Z8bGCtpWwElFmmzhHy0PWP9wVrIVNpfvAfq0i9xbl3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=czov6RNnZGRGvT6UniJanYr7GKHdU9PUjQxaZGvhBJefSQaWErpfJlma4Gi0uDv4eLeWs63ypifwombqugmGLdthWj61jmcqjhgJ6fsNqRiZEPiMGdqrOA4w7sgIKTmKrJReXnqrICde2dd1ytcpoStrKJfXGkAvesyCiq9M04Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=aP8GfSxp; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="aP8GfSxp"
Received: from [10.10.12.8] (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 3796D2FC0065;
	Wed, 26 Aug 2026 10:27:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1787732879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6YkkWufRzs9dENT+cgMm5ZgsDiLq3k8lXZD4z2Ojb7k=;
	b=aP8GfSxpF9XAV8gGC9lMdit2VxeIKI7cygnHImjDHo14pfiK+HW+NpomlCewk6gyOQg+xt
	+wIl+uN/fLKNQvv/DVQswVrR5xS0wXyL1+v826FKf0hYtfF3aMzIoDGTcCqRf6WkclwNsp
	OGy7XUkRsL90vuQHlfGRPaVJkdNoLC4=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <8d5a1226-da78-4dfd-9f75-1a7bbc4536db@tuxedocomputers.com>
Date: Wed, 26 Aug 2026 10:27:58 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] platform/x86/tuxedo: Use intensity according to
 HID spec
To: Aaron Erhardt <aer@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260826081149.235487-1-aer@tuxedocomputers.com>
 <20260826081149.235487-4-aer@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260826081149.235487-4-aer@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 26.08.26 um 10:11 schrieb Aaron Erhardt:
> So far, this driver assumed incorrectly that the HID spec requires an
> 8-bit intensity value to be honored. The spec actually allows multiple
> intensities for RGB lamps, but suggest to rather set brightness
> through the individual channels, which is also what the Microsoft
> MacroPad reference implementation does.
>
> Accordingly, this commit simplifies intensity handling by offering
> only two intensity values for turning LEDs on and off. All other color
> values are submitted through the color channels individually, thus
> avoiding duplicated handling of brightness.
>
> Additionally, the incorrect comments explaining the deviation from the
> MacroPad reference implementation were removed.
>
> Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 25 ++++++++++++-----------
>   1 file changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> index 11babc7c7767..8f1ffca0430d 100644
> --- a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> +++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> @@ -553,7 +553,7 @@ static int handle_lamp_attributes_response_report(struct hid_device *hdev,
>   	rep->red_level_count = 0xff;
>   	rep->green_level_count = 0xff;
>   	rep->blue_level_count = 0xff;
> -	rep->intensity_level_count = 0xff;
> +	rep->intensity_level_count = 0x1;
>   	rep->is_programmable = 1;
>   
>   	if (driver_data->kbl_map[lamp_id].code <= 0xe8) {
> @@ -640,22 +640,23 @@ static int handle_lamp_multi_update_report(struct hid_device *hdev,
>   					j + 1;
>   			rgb_configs_j->key_id = key_id;
>   			/*
> -			 * While this driver respects update_channel.intensity
> -			 * according to "HID Usage Tables v1.5" also on RGB
> -			 * leds, the Microsoft MacroPad reference implementation
> +			 * This driver uses update_channel.intensity according to
> +			 * "Color Attributes Examples" in "HID Usage Tables v1.7".
> +			 * Only two intensity values are allowed for turning LEDs
> +			 * on or off, while color and brightness can be controlled
> +			 * through the RGB values. This is also identical to the
> +			 * Microsoft MacroPad reference implementation
>   			 * (https://github.com/microsoft/RP2040MacropadHidSample
> -			 * 1d6c3ad) does not and ignores it. If it turns out
> -			 * that Windows writes intensity = 0 for RGB leds
> -			 * instead of intensity = 255, this driver should also
> -			 * ignore the update_channel.intensity.
> +			 * 1d6c3ad).
>   			 */
> -			intensity_i = rep->update_channels[i].intensity;
> +			intensity_i = min(1, rep->update_channels[i].intensity);
>   			red_i = rep->update_channels[i].red;
>   			green_i = rep->update_channels[i].green;
>   			blue_i = rep->update_channels[i].blue;
> -			rgb_configs_j->red = red_i * intensity_i / 0xff;
> -			rgb_configs_j->green = green_i * intensity_i / 0xff;
> -			rgb_configs_j->blue = blue_i * intensity_i / 0xff;
> +
> +			rgb_configs_j->red = red_i * intensity_i;
> +			rgb_configs_j->green = green_i * intensity_i;
> +			rgb_configs_j->blue = blue_i * intensity_i;
>   
>   			break;
>   		}
