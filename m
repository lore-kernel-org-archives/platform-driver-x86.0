Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF653FE64F
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 13:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777469001; cv=none; b=kRWiHsXWnL8Ez3mDkWN6bCw9yfdHpJFfEIemGo8ZTUU63rdWj2ZhlNtBkTXShzHHOOdz11sJVkF/sDri4INR0zuH6uamXPT35tdA+O6MrytxViW0dWlMXttHPJhroO9Cq+K9w/UwAV1USRsj64MtQoBDJueE8esiFL6yna6jK7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777469001; c=relaxed/simple;
	bh=cSdTD4btkTq+vvdlVsv2uEtMvmS3NANRFJVZJrVV7yQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=g7LjYx2XEXPs9Acvb3U0M/7pCclpaxwVwvTNu8HVJ9xl9LUMPdtpnstJ1egvp2aWktY0HGRyHFo3T02DEzH7Bdrjy8Ka066nCNH5ZDvLbH2R80oVnvb/XqNjylLvNHUPTwm6PZFNyvZ8W8zM/Ut0pBrm4HdM09U8+vl6bgiHuLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmcJrceG; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmcJrceG"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-6221c72515fso3922064137.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 06:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777468998; x=1778073798; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pfd+PHGHiZjMUfnOvtMwQJsaJvmmwBO+RkPzNYe4I0=;
        b=FmcJrceG8THNuVmCJaXJtJZTBYJO/Jbo0MDl2cXEQrotR0X4aoi2wOMXL+C8cc7kdz
         pfWLx+zG6jcjiTJbPnWsv18l75TJ7ghsXEJqU/7Uq+m44rKAdOEgvLrC22XIpWjcVyiP
         JLse4yLsHzmU7U23oVyGAhhsMAUdKJPPKd8yNt7wGQouUZHjKjXzAVWBGHKIeNwgxthE
         8Tcu36sXy0sEGehxx0Rsljh+bR+e/x2Uy6WuBgBWwhNxTiQIgSowavdRd0KhLCornbhB
         ReTRrbqySgn39uTU+Pwq+blvKvnC0yn6ibEXCsSLS2U0U3worq18VoQyjIFDRLur64YP
         CDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468998; x=1778073798;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8pfd+PHGHiZjMUfnOvtMwQJsaJvmmwBO+RkPzNYe4I0=;
        b=L45lRb9gc0RNc2nfc0D+GSkAu7RGkRw+2PpGK1rBVQcLi8rvgW8WB0lGPa/140EE5G
         19TcE3Pw0JaP1OBAqpQ/pwo37pkO1zObfhq9LUl48pD7uzWp5z4SPl1C6lIEXh3977oE
         fGcXQLbfbeTmCFPOj9lyel6QDtBjbNwdcwFz5IzsUg5nzfDvDmFzAG+rpvMpdhtg1P/h
         8TN+8p0cdpqwgoFYKq8/2LVSmlm4ITkCTihAU2xFCZoVKTdcrQDZ1XgXOsgmxAOGylxt
         g2A8cZcmrqlLEkbUIGryvORTJZV+MZvN7/SQrzy8DI5wQP4zBdfjty9fcg47g3ZwTTEJ
         ld4w==
X-Gm-Message-State: AOJu0YzH4JXrlzsaLYZo1I2UJm/zVTK7+7E+rYHyaNn/60qS0SKjRi3R
	9K2SXKna5J7kldU/4mFrrU7DFzWFm323Lc96XKRnNWB1VgwzaiKWIxf8
X-Gm-Gg: AeBDieuBUQLqzP8XdFwBNdsXPT22oVQdZVM5RlJQClfi03R+n0+JCLzdoPmYbv3dUQ8
	MbbSVR9CmTO6zvBf1nlgz4VjQJ7RXtd38CwJNDX4kZFW1xC846OUnB+m5zByOtEA8VTBy0EvZym
	yzyUoKscQ31xd2iRWWXmggmTpgiwA66QJiQbAb06oLPwV0OJnsyGg6HGvNrVSt2ra9bt96YOURy
	hLP9xzYgu3APfrSWZVLSvGPIxJpo1qA/8fFY5yyDaWR9G0T4bk90YdSU3PZwVEVZASGH8k8jrW5
	+NzvDC0a78G4BhjGIVw8UrLG3PsO1nn4p6WozF+lUl5uOE1vTLaMehR9pw8lkF+OowofGzj6EV/
	MnmNu4uHn7FWTnlhfrJm7qArciIxE9wQksaFYVHpielF5+PShBY50rEjC4RGzbHBKlqg4L/kA3i
	wA6t1I4yal45YbHJ1Jyc4volJl
X-Received: by 2002:a05:6102:504a:b0:628:6648:faa7 with SMTP id ada2fe7eead31-629271eeaa6mr2258756137.20.1777468997894;
        Wed, 29 Apr 2026 06:23:17 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-629847672cesm1021396137.11.2026.04.29.06.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 06:23:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 08:23:11 -0500
Message-Id: <DI5O65UZ12EU.1IC2SMB4DGNWA@gmail.com>
Subject: Re: [PATCH v4] platform/x86: alienware-wmi-base: Transition to new
 WMI API
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Armin Wolf" <W_Armin@gmx.de>, "Kurt Borja" <kuurtb@gmail.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>
Cc: <platform-driver-x86@vger.kernel.org>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260428-aw-new-api-v4-1-d2c06241d7ad@gmail.com>
 <795321b2-3655-40ec-ae10-02b0db799df6@gmx.de>
In-Reply-To: <795321b2-3655-40ec-ae10-02b0db799df6@gmx.de>

On Tue Apr 28, 2026 at 2:27 PM -05, Armin Wolf wrote:
> Am 28.04.26 um 18:37 schrieb Kurt Borja:
>
>> Transition to the new wmi_buffer based WMI API.
>>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>> v4:
>>    - Rebase to use the new wmidev_invoke_method() with size check
>>
>> v3: https://patch.msgid.link/20260331-aw-new-api-v3-1-ef03b94529d8@gmail=
.com
>>    - Use __free() instead of manual cleanup.
>>    - Include <linux/types.h>
>>
>> v2: https://patch.msgid.link/20260331-aw-new-api-v2-1-3b0d33bf8d22@gmail=
.com
>>    - Cast wmi_buffer data to __le32 and then use le32_to_cpu() before
>>      returning
>>
>> v1: https://patch.msgid.link/20260330-aw-new-api-v1-1-95910bfa1b38@gmail=
.com
>> ---
>>   drivers/platform/x86/dell/alienware-wmi-base.c | 31 ++++++++++++++++--=
--------
>>   1 file changed, 19 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/pl=
atform/x86/dell/alienware-wmi-base.c
>> index 64562b92314f..21d3acfbd73d 100644
>> --- a/drivers/platform/x86/dell/alienware-wmi-base.c
>> +++ b/drivers/platform/x86/dell/alienware-wmi-base.c
>> @@ -12,8 +12,13 @@
>>   #include <linux/cleanup.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/slab.h>
>> +#include <linux/types.h>
>>   #include <linux/dmi.h>
>>   #include <linux/leds.h>
>> +
>> +#include <asm/byteorder.h>
>> +
>>   #include "alienware-wmi.h"
>>  =20
>>   MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
>> @@ -150,21 +155,23 @@ u8 alienware_interface;
>>   int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
>>   			  void *in_args, size_t in_size, u32 *out_data)
>>   {
>> -	struct acpi_buffer out =3D {ACPI_ALLOCATE_BUFFER, NULL};
>> -	struct acpi_buffer in =3D {in_size, in_args};
>> -	acpi_status ret;
>> +	struct wmi_buffer out, in =3D {
>> +		.data =3D in_args,
>> +		.length =3D in_size,
>> +	};
>> +	int ret;
>>  =20
>> -	ret =3D wmidev_evaluate_method(wdev, 0, method_id, &in, out_data ? &ou=
t : NULL);
>> -	if (ACPI_FAILURE(ret))
>> -		return -EIO;
>> -
>> -	union acpi_object *obj __free(kfree) =3D out.pointer;
>> +	if (out_data)
>> +		ret =3D wmidev_invoke_method(wdev, 0, method_id, &in, &out,
>> +					   sizeof(*out_data));
>> +	else
>> +		ret =3D wmidev_invoke_method(wdev, 0, method_id, &in, NULL, 0);
>> +	if (ret)
>> +		return ret;
>>  =20
>>   	if (out_data) {
>> -		if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER)
>> -			*out_data =3D (u32)obj->integer.value;
>> -		else
>> -			return -ENOMSG;
>> +		__le32 *data __free(kfree) =3D out.data;
>> +		*out_data =3D le32_to_cpu(*data);
>>   	}
>
> Hi,
>
> calling wmidev_invoke_method() with a NULL output buffer will likely lead=
 to crashes. This happens
> because wmidev_invoke_method() demands that a valid pointer to a output b=
uffer is provided by the
> caller. I suggest that you use wmidev_invoke_procedure() instead:
>
> 	__le32 *data __free(kfree) =3D NULL;
>
> 	if (!out_data)
> 		return wmidev_invoke_procedure(wdev, 0, method_id, &in);
>
> 	ret =3D wmidev_invoke_method(wdev, 0, method_id, &in, &out, sizeof(*data=
));
> 	if (ret < 0)
> 		return ret;
>
> 	result =3D out.data
> 	...

Hi Armin,

You're right, I thought the only difference between _procedure and
_method was the size check.

Also, Sashiko [1] reported that out.data might be ZERO_SIZE_PTR even if
wmidev_invoke_method() succeeds. I thought it was a false positive but I
looked further and it was actually a bug. I submitted a fix for this.

[1] https://sashiko.dev/#/patchset/20260428-aw-new-api-v4-1-d2c06241d7ad%40=
gmail.com

--=20
Thanks,
 ~ Kurt
