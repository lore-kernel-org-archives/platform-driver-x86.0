Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876473B52FA;
	Wed, 26 Aug 2026 21:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780226; cv=none; b=PySoXJNZxV9Ew0qzveYoFzE/FzE2ppJRRVFQUeELlJwbHwDVjIiu8gb/6Ofc8XLynONhzoexx8AJYuAiloxmjKE6GIxDDmZkeYmVhFOFDlLRsd5mS4xGwnPKlqFdovhG9k817CWJ8w+z1UvHzqxu5dc9l4Il8Hw0naBjqC8lPhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780226; c=relaxed/simple;
	bh=obqfey1aknL9rsnhuCI9BNDHEoRnq4gU4BSsBtVOYgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I/QTQ5zKXEu3JwWY/SDKdLm+CY+ZSKdBw5LwAVB9OxcPYG79stGip17YzCif8ypEQMJWYjr+oY/ShAt0CEgCnauiqewuYL3i1MJ529WMmlzroxzHAcaY98XoUOtYWJjSldr6uRLqap3CdyBPIYSKs8Rggh6hfiCstJuuH0E6k7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QF2lLHIy; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QF2lLHIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1787780222; x=1788385022; i=w_armin@gmx.de;
	bh=UYav0N0Z8F2rjIVOSs349HlZgDEKevgsVCUldU2oEHs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QF2lLHIyXoU0tRnsnrlcOC9cHUB1HvlCmm1otjLW4x9RaGQ05Q6YCCJd1qD2BMZw
	 nizP4Imb8douMVy/RWIsjkYtZokDBIc0dtwHngdBHn6kJH+th9mn3nX9/9KTEn9a5
	 MMPAJwjpJo5yk5qSx97gdez6YlxKu+WygMDi/X5JGEPIkkKj7kcXk7kAR5E+s691j
	 c5hMSUWfnHKSRpaIFlhTjF0F1VlyG0WRYkNgpAf274KKBsATUhmR0coXvRfiEChX4
	 mT2Gro7+aJi1QyArQH85UsW9rYlG2XuEYnFClqPjSlFKmJ6zyV9CZdAXjcKv5lHjn
	 MlNrLk0TW9JRV9D+xQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNt0M-1xJ2wQ13ge-00IoD5; Wed, 26
 Aug 2026 23:37:02 +0200
Message-ID: <c84328eb-0126-4558-8241-a41e641f9681@gmx.de>
Date: Wed, 26 Aug 2026 23:37:01 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86: uniwill-laptop: Fix brightness
 notify for 3 level keyboards
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260822003012.851574-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260822003012.851574-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OB5XnmgN54LjRVFZ5v99xeETKXGsqUx31LAO31ewK7oZto/EFoj
 AjfbLuoEO9djQ/Jaur8Rv/7TzjS4x1oHDITS9y554STGOTcsVwM2CSwoay4WGQimqo1aDuq
 dhRh7H91n8M55Q2435sagZdn72OQYqIL2Af4pkVsv/9Yc43XaH7oThicpq/p960QZjuTXzl
 tAtVwn8GdxcFNQ+mFYTtA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qn4KluXYq5E=;hNakuJxArdD0hHmU/X3mHs60ivW
 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

Am 22.08.26 um 02:28 schrieb Werner Sembach:

> The devices with 3 brightness level keyboards send
> UNIWILL_OSD_KB_LED_LEVEL0, UNIWILL_OSD_KB_LED_LEVEL2, and
> UNIWILL_OSD_KB_LED_LEVEL4 and not UNIWILL_OSD_KB_LED_LEVEL0,
> UNIWILL_OSD_KB_LED_LEVEL1, and UNIWILL_OSD_KB_LED_LEVEL2.
>
> This patch maps the events correctly to brightness levels 0, 1, and 2.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
> V1->V2: Use the events as source of truth for brightness_hw_changed valu=
e
>          again to avoid a race condition as Armin had pointed out.
> V2->V3: Return error for unexpected brightness level count.
>
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 26 +++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 7a2eeaec4c961..5df3611919ce3 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -1631,6 +1631,32 @@ static int uniwill_notify_kbd_led(struct uniwill_=
data *data, int brightness)
>   	struct led_classdev *led_cdev;
>   	int ret;
>  =20
> +	/*
> +	 * The devices with 3 brightness level keyboards send
> +	 * UNIWILL_OSD_KB_LED_LEVEL0, UNIWILL_OSD_KB_LED_LEVEL2, and
> +	 * UNIWILL_OSD_KB_LED_LEVEL4 which need to be mapped to 0, 1, and 2.
> +	 */
> +	switch (data->kbd_led_max_brightness) {
> +	case 4:
> +		break;
> +	case 2:
> +		switch (brightness) {
> +		case 0:
> +			break;
> +		case 2:
> +			brightness =3D 1;
> +			break;
> +		case 4:
> +			brightness =3D 2;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
>   	if (data->kbd_led_single_color)
>   		led_cdev =3D &data->kbd_led_cdev;
>   	else
>
> base-commit: 54745d563114b74f6fecebce68cd020d06c1772b
