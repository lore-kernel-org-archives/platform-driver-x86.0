Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A382328A3F8
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 17:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745427959; cv=none; b=Snqcu3/wC+185AhH77M+O+zso9Hstuw3Aw4a+gwDxquwX+t7VYRn1AufOsuB+2eicrls4ZAj/YL6kDwkKdu3Gl3Pz8BkRFgnSmWv6I2GEoTQ8pGIGhLdW6X81QhNPKAFJNpzt3pZhiPiw6ScBriBSbeo9yFUiVnl/fvj3+IKj/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745427959; c=relaxed/simple;
	bh=+ieYwaDCw94dSTBEsxjc2oXkTMPtIySnWtLyPN0/FNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OAaeDKCbGMezT+EpVfSqYS3tptMntDYb2Tks0Xr3AttFpVEi4OEOgwogrFrYi2p7E24NXjGMOE12l8zrSuTKNokVOCyCzM/K0anWS/MK7Ly7qCWJh17ALDqOVwizI9+W8d25oCHw+WgqZAg+lApunF5zxIecnncokGHUt/2YBEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iAAvUJ4K; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iAAvUJ4K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745427956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jJbMTWCqncnPcN2b8Q1cWkuDPNiPsy4soPd5FpvRDOk=;
	b=iAAvUJ4KVyP7MIbg0xNwHznf9hCiM5X3xILGVooKXynCfeEldIOEKnL/fSNwbcpaDk82/v
	WpLZ/yOvobgkKE9FCs0qMJE4jRji5yvgEKza2Ph5oa0vP7oncn2VLLUwf74vKy08U01XlX
	wADKXwcfOwXpZ52YyX1trk1CPadMo1Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-GsegkIQWM5SYFgeAOk96Tw-1; Wed, 23 Apr 2025 13:05:51 -0400
X-MC-Unique: GsegkIQWM5SYFgeAOk96Tw-1
X-Mimecast-MFC-AGG-ID: GsegkIQWM5SYFgeAOk96Tw_1745427950
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac3e0c1336dso7013866b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 10:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745427950; x=1746032750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJbMTWCqncnPcN2b8Q1cWkuDPNiPsy4soPd5FpvRDOk=;
        b=QYe874bVezapgWL3DGGkVmPoFJBP39SisfkSoUai45w6qBiiBt6zIRJhPruycgUbIH
         JeATvqBZFjkktT4s/bUPkQWE2+Ky78a94Jb+hnO351LKONWCxDYt++UwewM8XnH+B1NW
         EA3I4whrw595CZdp/Xo1qI0+Mw74o7N0aiqtNBJvFOGg1PcHQLgSMQA/fkMN68srpRky
         UeoVsvp4jwu+dQmTQ5fyR3+9bG5L45fta5bVzryO62Vw5zdOVzbtL+8AKq2vp6Ww6sod
         cYUGDK43Ea1JWH+lT52Ul8kt8stPGe5A91eQTEt2WaIf7Gl9frekKweTRzs0oZ8/ANie
         uN6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlVeSw9YHqTucxCOjlwzOKG9egs/cote5KVFU6n3qSL9ypwVdjV2q/pkN7FQPbugDmHUApA1d5xk2FzaCCSCUQ7yzZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1kgsDC1P5/P+YLn/5u0ivG4HrQCHvjmcbmI1rKYnbyMrjZVfU
	IINd4VM9BcLG+tcfHWObsbKscFp0Gude/BXehEaH9maJy2/10WpCwhXWfnhNt1vVuIrfBV+L/dQ
	3SEuYUQCafZ6G2glU3FECguOJ1cgAtgS8E9yhUxK1ZgDNSGpr6M7791U8vZk5gLUIKScgahk=
X-Gm-Gg: ASbGncu8EhPaauL71luJV6Tylhxk8oGvxVbifcoPzbyDW3mQzampqJCq8yc/SMumIzZ
	khnYtLaou9kT98NM9qhd/0lfl9sCCzkIVkFLNRHHwVDo0PlD6LW0QIkFo1TKZ6Xyp4dziiQ7g1v
	7J8eZ6vcuO0RXYiWA0/vR5a9NyE5kROoiqIjWMwmxglciGvNCiDhtZ0LaPVgq3qo9to90Lhx2fM
	jsy1QpxCtehiuzNwlYJdzDQpKr5gYu/HHiO9KuQP+mGbng2BmBMDlX73moCVdGc7RPNMH4QlB7Z
	9DpQ2Q+3L+N11AERqcBejOPQqnnnGc4IfNN7TioVoIzgvMJaIeGnkywDubFRv4BrWVp4sevfP9x
	2YmLjBdm7S/GQ7iMUPzu7Sr7ZfLoi1oXsp6io5cYlwXuEBrvBRNaHm0XDXAT/2Q==
X-Received: by 2002:a17:907:2d06:b0:ac8:1142:a9e5 with SMTP id a640c23a62f3a-acb74dd5490mr1382501966b.47.1745427949874;
        Wed, 23 Apr 2025 10:05:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGUfyLp7pQ4wJXXGTs2A/h6iN7pW1UaixQPCQ/wM5hvKHeCIIA+Ui+fcJHeyhgvS/98gQqCQ==
X-Received: by 2002:a17:907:2d06:b0:ac8:1142:a9e5 with SMTP id a640c23a62f3a-acb74dd5490mr1382496266b.47.1745427949256;
        Wed, 23 Apr 2025 10:05:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acbb945b434sm335158666b.184.2025.04.23.10.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 10:05:48 -0700 (PDT)
Message-ID: <3ae149b5-a936-45b4-8887-eb7cde1ee4b0@redhat.com>
Date: Wed, 23 Apr 2025 19:05:47 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] platform/x86: dell-pc: Transition to faux device
To: Kurt Borja <kuurtb@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lyndon Sanche <lsanche@lyndeno.ca>,
 Mario Limonciello <mario.limonciello@amd.com>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20250411-dell-faux-v1-0-ea1f1c929b7e@gmail.com>
 <20250411-dell-faux-v1-3-ea1f1c929b7e@gmail.com>
 <2afb6e58-44cb-486e-8062-074ff397dc2c@linux.intel.com>
 <1e8a6fe0-518d-4eac-9895-51179ca23f36@redhat.com>
 <D9E5H5B9X448.12FJT48775C50@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <D9E5H5B9X448.12FJT48775C50@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kurt,

On 23-Apr-25 6:14 PM, Kurt Borja wrote:
> Hi all,
> 
> On Wed Apr 23, 2025 at 10:44 AM -03, Hans de Goede wrote:
>> Hi Ilpo,
>>
>> On 23-Apr-25 3:27 PM, Ilpo Järvinen wrote:
>>> On Fri, 11 Apr 2025, Kurt Borja wrote:
>>>
>>>> Use a faux device parent for registering the platform_profile instead of
>>>> a "fake" platform device.
>>>>
>>>> The faux bus is a minimalistic, single driver bus designed for this
>>>> purpose.
>>>
>>> Hi Kurt, Hans & Greg,
>>>
>>> I'm not sure about this change. So dell-pc not a platform device but
>>> a "fake".
>>
>> Arguably the dell-pc driver does not need a struct device at all,
>> since it just exports /sys/firmware/acpi/platform_profile sysfs
>> interface by using the relevant Dell SMBIOS interfaces for this.
>>
>> As such maybe we should just completely get rid of the whole
>> struct device here?
>>
>> If we do decide to keep the struct device, then since the struct device
>> seems to just be there to tie the lifetime of the platform_profile
>> handler to, I guess that calling it a faux device is fair.
> 
> I think it's important to mention that a parent device is required to
> register a platform profile, see [1].

Ah ok, that is new, I guess that was changed with the new support
for registering multiple platform-profile handlers.

> I guess we could get away with removing the device altogether from here,
> but that would require to find another suitable parent device. The
> obvious choice would be the `dell-smbios` device, however that would
> require exporting it in the first place.
> 
> For some reason, exporting devices doesn't seem right to me, so IMO a
> faux device is a good choice here.

Agreed.

> Another solution that would make more sense, lifetime wise, is to turn
> this into an aux driver and let `dell-smbios` create the matching aux
> device. I could do this, but I think it's overly complicated.

Yes that does seem overly complicated, lets just go with the faux
device.

Regards,

Hans




>>> Is it just because this driver only happens to call
>>> dell_send_request(), etc., not contains that low-level access code within? 
>>> Or is that dell-smbios "fake" too?
> 
> IMO `dell-smbios` is "fake" too? It is there only to expose either the
> WMI or the SMM backend through a single sysfs interface.
> 
> I think a more natural design for `dell-smbios` would be an aux driver
> that exposed it's interface through a class device. Maybe I'm wrong in
> this regard though.
> 
> [1] https://elixir.bootlin.com/linux/v6.15-rc3/source/drivers/acpi/platform_profile.c#L556
> 

