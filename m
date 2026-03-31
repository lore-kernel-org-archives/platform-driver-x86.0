Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF37636CE04
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 05:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774933903; cv=none; b=ac7ZVvaR7puXoLSrwO3cIoLNfHW2/L0jqt3CCM0pR975XbEBFOp2vj3WU0mCKQlspnYqTzEBZLfc3CrvlIO13e3ORvwo8JW7lPqeKP/yU0GxphMqDa1kELCxhU1Dxn0jVlhGt4q4qE/b4E7YIaO0LoyItJe9f0tcKedjZlfi29U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774933903; c=relaxed/simple;
	bh=HKMawJjoAKZrHLq1BQGqWJvdWHBeduO5+GZyQ7U++vc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=g10F7dvpV34hwbzIHqZOhU4/4orCM2crMRcOD7wHum2pyE9Ac94p/kQ+UdCdiYBQ1bB/yjlyiiGySuTmTiXeGH90kGIwiokPvubs1DC5EjTAZtycBAc/3plSB5DfI1z/txSrETIPBl3fQlmAgtamUfo2BLemZixY96pxU/037iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTCvq8iw; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTCvq8iw"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56cc6fe8815so2131894e0c.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 22:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774933901; x=1775538701; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3k2Oe9yXROagha6yRK/lSOmu7b8fhlcHMaOLPb6IRKc=;
        b=CTCvq8iwsxRA8G6yyzMzguwXQWDM8Zr6M0MAoSpW5OmlXxVXpXDtimRa+8cmJzI/vC
         v9/n4SwQunuxzGgFzX9AepoDy9dChlwcpYBWnVLC6/uFy/kxyff+1zDeFHj65f7Iiyk2
         QQ41fq9uXyjSx9iFiyot909d0V6IlG2A3m0UXogx+kwoj0psbMt2A1va5B889BwTu4/R
         UcXw+I8S3fW8x2fUMOYIN4t/URJynbxEinErYXEKDHvwV9olUIQlZiIt0cNOArzkEP1q
         y9tur1Vbs3J0stjJPRaQ9sQ9kmA0k9rC3ZuODWOER2NEZtdPBVAa27sgjCgT61qsqh+H
         S+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774933901; x=1775538701;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3k2Oe9yXROagha6yRK/lSOmu7b8fhlcHMaOLPb6IRKc=;
        b=etjOfgYIsdSYxHGNuy9pO8e6xSJRySp32YWDnWCTSuBCYEoukZU52v6enDc5J3eFaf
         HA5gdeZoZrvHZGTDqWh6YJ1pi4L6XRHKNZ5IR+FXC2RvPcq2AAEAM+EEZrXh7PwWnmLH
         5KnPOomFs8ctD5LZfFvXEiGK/w5o5PRsKuGRE96VHOAA4w5/khBIoM6DuM4+/bUIp8/D
         C5QKlwVovswkBP4AfiUtt3Fz0TVdOGbFik66nW6GnyPLs3YSv2VCWa8Hqcg/rlJ+9R12
         5j7HEUm7B6/LemklaPA8pXcgDYZBXeEgAV0PSe+FbUvB381BH58InsUOQxasWX/jPHAn
         RDKw==
X-Gm-Message-State: AOJu0YwsRcSHSKr9gBuX/k5yRgNhV+FiRpJpFT/BlqXx1iUv+dfX1ojP
	AUmUsqGlZha4tlse2wOtBluRBbsAAMvBncPSVgKwhsVwuAYL7Yd9DqWG
X-Gm-Gg: ATEYQzyV6H9pqWQdxZxQjtXJKLQNZw1P7uGShnKRzb/FN5EgddtrQMcw0VXYs7X6Del
	GwuaKM2IQAaBD9Fw2oMKGP8FCZFHhQTSbcRKOO4kuJx20PxnT61rhHCMf1WTSbr9ZvKgIhoTYFV
	3hS1lU3x23MYTNjxb/VYdMWh6fPEAy+h5C06mVet2vRt4wY1UXNopSdNz/Ghfkcv2kqj267x/4n
	zRaEAncD3raX2LbtAr1wb5UwmlzwxZglBzfohLq1ak7Ctag2EkeRRC7C+IuXsmo/P9AkrIk6x6+
	FSNuO/wNie21RqKmauOV73k7LEo7wyc1p5V2UYHV45F7U7gtuej/XDR/74KLBnpcAA9rwFqD8Vs
	Tt5xal+XsFn6K9VT4kcnU/CkRXc65cFM7vYyioBl12v7z3RAntfSJDzbpX2eRY8QczInKoe1aU6
	ajliimTmD1P7hg6w==
X-Received: by 2002:a05:6122:458d:b0:56d:3b69:87d2 with SMTP id 71dfb90a1353d-56d4a5f8ef4mr6396751e0c.11.1774933900756;
        Mon, 30 Mar 2026 22:11:40 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a46f4dsm11564060e0c.15.2026.03.30.22.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 22:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 00:11:33 -0500
Message-Id: <DHGPJY9K6HMT.14WH9C5KDC7B5@gmail.com>
To: "Armin Wolf" <W_Armin@gmx.de>, "Kurt Borja" <kuurtb@gmail.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>
Cc: <platform-driver-x86@vger.kernel.org>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: alienware-wmi-base: Transition to new WMI
 API
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260330-aw-new-api-v1-1-95910bfa1b38@gmail.com>
 <ea8c7adc-7caf-4305-b2c7-dca38524629c@gmx.de>
In-Reply-To: <ea8c7adc-7caf-4305-b2c7-dca38524629c@gmx.de>

On Mon Mar 30, 2026 at 6:26 PM -05, Armin Wolf wrote:
> Am 30.03.26 um 17:50 schrieb Kurt Borja:
>
>> Transition to the new wmi_buffer based WMI API.
>>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>   drivers/platform/x86/dell/alienware-wmi-base.c | 29 ++++++++++++++----=
--------
>>   1 file changed, 16 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/pl=
atform/x86/dell/alienware-wmi-base.c
>> index 64562b92314f..ef2b4893b7b5 100644
>> --- a/drivers/platform/x86/dell/alienware-wmi-base.c
>> +++ b/drivers/platform/x86/dell/alienware-wmi-base.c
>> @@ -9,7 +9,6 @@
>>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>  =20
>>   #include <linux/acpi.h>
>> -#include <linux/cleanup.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/dmi.h>
>> @@ -150,23 +149,27 @@ u8 alienware_interface;
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
>> +	ret =3D wmidev_invoke_method(wdev, 0, method_id, &in, out_data ? &out =
: NULL);
>> +	if (ret)
>> +		return ret;
>>  =20
>> -	union acpi_object *obj __free(kfree) =3D out.pointer;
>> +	if (!out_data)
>> +		return 0;
>>  =20
>> -	if (out_data) {
>> -		if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER)
>> -			*out_data =3D (u32)obj->integer.value;
>> -		else
>> -			return -ENOMSG;
>> +	if (out.length < sizeof(*out_data)) {
>> +		kfree(out.data);
>> +		return -ENOMSG;
>>   	}
>>  =20
>> +	*out_data =3D *(u32 *)out.data;
>
> Please cast the output data to a __le32 * and use le32_to_cpu() to take t=
he endianess into account.
> The rest looks fine to me.

Hi Armin,

Will do -- Thanks!

>
> Thanks,
> Armin Wolf

--=20
Thanks,
 ~ Kurt
