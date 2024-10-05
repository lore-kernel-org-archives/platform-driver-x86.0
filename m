Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB753153598
	for <platform-driver-x86@vger.kernel.org>; Sat,  5 Oct 2024 16:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728145633; cv=none; b=e9nt5ua1rhrVJbQ/I+Q1mqGDnremkLEq/lQdBwy5I4AwqDNy88XxtnyQpSUsFTDw3LvImuPkjpZ4bvdhrFbufENEdFuJ2w4lwvKbsHHE0X5DE/8Wg1KxLoSFYGaiFz1gaNCNOErf2dUoUPAoKzYmfxhklSyejcuaFcI7ayFFZX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728145633; c=relaxed/simple;
	bh=9ZvisnSJRFJ2ogCvSEG1YlRdGpHNkC/TDJASCuC9Sgc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KFOXoZYRBVG8/uvs++49AMpP/A1DTlW/U1k3YUJqnPMqS/fC+TtH5iUSuq1ciVtrWSm2RriLMYEKugNc0gjGAcgfDMGZlg0rhtSTTPvDFQ+So45ucFfNmxS7nklKcwgTzoA8tIMx28lXuz9cdKXzdZcM3tP8ZZ1KFGUmDNhUqIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QuNVLbxN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QuNVLbxN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728145630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zq9NLdq207yX9JNveWp2gfaOV1UfC2nKX+dyW5rdSYk=;
	b=QuNVLbxN08immEPyJWAXKVMFUpZKKfRVu+AmsZVH4x/RL1iHR9h339mWBk2hrzcEYAVQ1M
	VwD9zrVH+RsXZmgV2jvblSkBvGZIrkIZYdirU263t8i2NhRDuFMhN1vDig1fnqnmMYk13M
	W2fUK+X65LOmA0HMBhznUJr5VGNBIPc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-IcseyS3DNeGS7mtvrbIz9A-1; Sat, 05 Oct 2024 12:27:09 -0400
X-MC-Unique: IcseyS3DNeGS7mtvrbIz9A-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5c87c784d50so2413527a12.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Oct 2024 09:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728145628; x=1728750428;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zq9NLdq207yX9JNveWp2gfaOV1UfC2nKX+dyW5rdSYk=;
        b=YhPImoCUQ1Ovi3EaKxFswoOTjNkG2Hds+tR3AqlVJxyKn5niIrGtCkZaT7c8ScExwk
         Db1aoUduWzmjpvKtgOD4ZajQChmdrpl592eSleTjyvLPzbn6fKMMQBJfCksdaP4hbmJx
         doggYUgKse8X2LroWgpfS2VDCEelUVIeUjYKPwbK1Ptp3UOmlNJZ6Iw0Hk4yXsaL7Av6
         ToE3JEPM4mhH+KlfKIxVRqkewKwh1YIEr0RwSlGW59Vu1euQkzsKukMOHcSmrjasGhZt
         m5BATitGQKMCNX4aa/9yUOopywvjuiNPn81vkIZbrFRgOVDE18QTZE0dFy2Bib+Dypaa
         c5fA==
X-Forwarded-Encrypted: i=1; AJvYcCUAA8gdfu+OovOoWKCxJpnr1kJ+JkK4BmuRe1y54hY9aMmgmM7pvg0fm9ov1On9jwTx8oEBkagA4S2ZOecpqmcIRh/Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzVguOjpYLs8cIP3+3O+2tad1BVs9qI/Er7OgigGCwd+iqsMZXQ
	C/K1bwK7qKl0uf3UZE5V7+VltgnH0xa/XmdIOyC6CBLu9wVfb2FmFCISbfODa/8W4DPqc/1v2Jo
	kzqzDb9DOiJVYEfICGo3C0LClH12mzt970wm8x7Ryt16/IjbkRLXNyEknSfnwAMDbeGAvvmfTIl
	Z9irm1Mg==
X-Received: by 2002:a05:6402:440a:b0:5c8:8db1:1d55 with SMTP id 4fb4d7f45d1cf-5c8d2e3a6b2mr5583022a12.10.1728145628193;
        Sat, 05 Oct 2024 09:27:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6MHGfvxfFnEvu59h2PTnO3h6b30JWK5W4rpCsx0+ltgIv+w8CVFY0YoMmP9mSTxzCoBkVcg==
X-Received: by 2002:a05:6402:440a:b0:5c8:8db1:1d55 with SMTP id 4fb4d7f45d1cf-5c8d2e3a6b2mr5583008a12.10.1728145627790;
        Sat, 05 Oct 2024 09:27:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05aa730sm1146228a12.36.2024.10.05.09.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 09:27:06 -0700 (PDT)
Message-ID: <f8042679-a469-4aaa-8671-a6dcaa894e8c@redhat.com>
Date: Sat, 5 Oct 2024 18:27:05 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] acpi/x86: s2idle: move Display off/on calls
 outside suspend (fixes ROG Ally suspend)
From: Hans de Goede <hdegoede@redhat.com>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 platform-driver-x86@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>, luke@ljones.dev,
 me@kylegospodneti.ch, Denis Benato <benato.denis96@gmail.com>
References: <20240922172258.48435-1-lkml@antheas.dev>
 <134adbb7-06c5-4b6a-a8b9-abb973784f73@redhat.com>
 <CAGwozwG49xkWoFVybsVzpa=eG1U2YVCMdr8qc-HwRWSqEKCv0g@mail.gmail.com>
 <c19490b6-dc4b-47b3-b422-d244a6b87e5e@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <c19490b6-dc4b-47b3-b422-d244a6b87e5e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

p.s.

On 5-Oct-24 6:24 PM, Hans de Goede wrote:
> Hi Antheas,
> 
> On 5-Oct-24 5:10 PM, Antheas Kapenekakis wrote:
>> Hi Hans,
>>

<snip>

>>> IMHO it would be good to submit a v2 of just patches 1 - 3 run through
>>> checkpatch. Also the commit message of patch 3 should point to the existing
>>> quirk code in asus-wmi.c and mention that then is no longer necessary after
>>> patch 3, then we can discuss what is the best place for these quirks.
>>
>> I did run it through before sending the patch. However, some of the
>> warnings were a bit cryptic to me... I will run it again.
>>
>> I will add a note for asus-wmi on future patch series.
>>
>> First 3 patches of the series are designed to NOOP before patch 4. Did
>> you mean patch 3 (which adds the delay) instead of 4?
> 
> Ah I misread the series and failed to notice that patch 4 actually hooks
> things up, I was under the impression that patch 4 hooks things up.
> 
> But I did mean that patch 3 might lead to discussion not patch 4.

Oh and upon re-reading the series I see that pathc 5 is just dropping
the quirks from asus-wmi.c, which is fine.

I somehow thought that the later patches where adding a way for userspace
to already enter the LPS0 display off state earlier. No idea how that
idea got in my head ...

Regards,

Hans


