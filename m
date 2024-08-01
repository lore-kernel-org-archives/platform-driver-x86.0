Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E2716CD39
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Aug 2024 14:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722520881; cv=none; b=uZu0/rzDb6AuHP50LyZ54GVCtF0Fd+rKKGEiLT6tyxf+SqtVHlW4fAB7E1qsMml6N+KRNtQLrfk7qDrwGCAUofMcrNU+GC1q2OE3r00G8dJFFwILpshqq0VYYkNq/6d1OhxUkR4PKwc84L6CnAN0SpiNdaY8Ofof5HAFOqSaVuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722520881; c=relaxed/simple;
	bh=8bMRJX5Wva0XdUpS4bnRq3LDkoZbYGfLBZUwOtB3FFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YfOfSH6D56obls4bWu0d2gvtoYn4b8RMRANv3QGbGeN0eY5eAAqSZveBeQygxnCeFAVhURJWc0TT/Ym2y1o8OmQc+Sz62R9nmxiT2ekWpRt4k10U7PSRBMsNBbWaRmw7+cCv6XEEFQlkaZe2NhzQlXuk7mm99Jvl85cKtBXCTLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eMxlEBXY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eMxlEBXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722520879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=85tqexyUb9G9xesjtDuJjUBYMhn4OYlFpDKqijS2vtE=;
	b=eMxlEBXYKyzkiuh84iNq9Q7fKeLxxgv41ijAfyhubExLToqsatK4QpzksrxGSFQxKgLWfJ
	+XHeFlPTnRoyFV43O74KQv0iZqu02FZoAb+vOAG4PRugdkOMji/02Az8E/rDmUmJ1mSnTW
	O+5pWLncqSpqjp1PzhdXGmAoQp0oQXI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-R09Mm-pGOpSBjVXKUCz5Wg-1; Thu, 01 Aug 2024 10:01:17 -0400
X-MC-Unique: R09Mm-pGOpSBjVXKUCz5Wg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5a30be1c5cfso7593745a12.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Aug 2024 07:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722520876; x=1723125676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=85tqexyUb9G9xesjtDuJjUBYMhn4OYlFpDKqijS2vtE=;
        b=u+6RQkQcpHR4ALWYVpHaqCHWNA5WQ8dbDcHtgB16kJ63aopYgtqu1GTL6XIelkFfse
         jDIbqMvmf5VfMhih7tNsd5KhnfzZC5fxrheJT96Yo/k4/7XL6U5WVPZpEsfW+VuzXEBt
         N26tPIb5P6bmk4IDSuuo4SWQF+NGi72L5G57HLamzX3HUmx69KpN/PcupnNEnj0j6NuA
         XKUYYsqKaSOXVvFP6fcD0Qo+xyko8b/45rD+A6KozYvhWPNM9UTs1DchWROR00oUjkBA
         q6P87SahhSwXyWKnEm7/rcDi/LvBDzqMPvE5az6prSd2GQfpxA7Jl2zCJ5O95esPspDg
         aAJA==
X-Forwarded-Encrypted: i=1; AJvYcCV6W093k01p781JvTa5eYhkuHx/nGC3KiSc6zr1HIb7aQdyORx1Typ7vKiEc5nazcjiSGVLZQmw1ZqMGMvWMCdzmv9j6mSrTG7Dy9xvV8jyLFrS5A==
X-Gm-Message-State: AOJu0YxPRWFr6YWc6D/8Efd1ADsbhcBNzZGLaGy8sknDr0dgXEDGGRpq
	MHR8RLUl2kC42W++vjfTQUKQyXpTRKRpP793LxL/JhhQ1wNfmMl/6v7i5brZ1O8d460NrAwy/1E
	5tvkvwVoh9rR7xwIIjlZBXOovAzuy7Le4WAriqP9DTUaBGkaoZMtEeVl4QGG7OcDyf5nU/tM=
X-Received: by 2002:a05:6402:457:b0:5a2:350d:dfb9 with SMTP id 4fb4d7f45d1cf-5b7f36f56f8mr291500a12.2.1722520876162;
        Thu, 01 Aug 2024 07:01:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9oZedRaBpD4yRHIOSqQmwf9AUGq1ILfzXuz8c08wd3DL7M8+kU29GMpYyUDMMmaBdEgKdFA==
X-Received: by 2002:a05:6402:457:b0:5a2:350d:dfb9 with SMTP id 4fb4d7f45d1cf-5b7f36f56f8mr291409a12.2.1722520875045;
        Thu, 01 Aug 2024 07:01:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5afb9422c41sm8608972a12.82.2024.08.01.07.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 07:01:14 -0700 (PDT)
Message-ID: <c3be1b7f-8a4c-42d8-9a5d-6a341c5beb33@redhat.com>
Date: Thu, 1 Aug 2024 16:01:12 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] platform/x86: asus-wmi: add support for vivobook
 fan profiles
To: Luke Jones <luke@ljones.dev>, Mohamed Ghanmi <mohamed.ghanmi@supcom.tn>
Cc: corentin.chary@gmail.com, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240609144849.2532-1-mohamed.ghanmi@supcom.tn>
 <20240609144849.2532-2-mohamed.ghanmi@supcom.tn>
 <9daef2c6-6df4-4f61-966c-239450de7b4e@app.fastmail.com>
 <ZnlEuiP4Dgqpf51C@laptop>
 <ebad3eec-576b-46ef-887b-6d3ce31bd5f8@app.fastmail.com>
 <ZqopEfPCuU7-7mUR@meddabeast>
 <d21a1be5-7589-49e4-a96b-cddf9b6c15eb@app.fastmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d21a1be5-7589-49e4-a96b-cddf9b6c15eb@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/31/24 11:06 PM, Luke Jones wrote:

...

>>>>> If Hans and Ilpo don't have any requirements then:
>>>>>
>>>>> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> 
> I have no issues with this patch and it needs to be merged before I submit a stream of work. My signed-off tag is above.

Reading back the comments about the function names I believe that
the asus_wmi_platform_profile_mode_[to|from]_vivo() names are fine.

And the rest of the patch looks good to me to:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I have merged this into my review-hans branch now with one small change,
both asus_wmi_platform_profile_mode_[to|from]_vivo() ended in:

       return mode;

}

I have dropped the empty line after the return mode; statement
(in both functions) while merging this.

I've also dropped a spurious whitespace change (extra empty line)
added to asus_wmi_platform_profile_get().

Luke, please base your coming work on top of pdx86/review-hans.

Regards,

Hans


p.s.

One thing which I noticed while reviewing is this:

static int fan_curve_get_factory_default(struct asus_wmi *asus, u32 fan_dev)
{
        struct fan_curve_data *curves;
        u8 buf[FAN_CURVE_BUF_LEN];
        int err, fan_idx;
        u8 mode = 0;

        if (asus->throttle_thermal_policy_dev)
                mode = asus->throttle_thermal_policy_mode;
        /* DEVID_<C/G>PU_FAN_CURVE is switched for OVERBOOST vs SILENT */
        if (mode == 2)
                mode = 1;
        else if (mode == 1)
                mode = 2;

        err = asus_wmi_evaluate_method_buf(asus->dsts_id, fan_dev, mode, buf,
                                           FAN_CURVE_BUF_LEN);


Since asus->throttle_thermal_policy_mode stores the raw mode, which has
silent/overboost swapped for vivo notebooks I wonder if we should still
do the mode 1/2 swapping here when on a vivo notebook ?

I have a feeling the swapping here should not be done when one a vivo
notebook but I'm not sure.

If the swapping here should be skipped on Vivobooks please submit
a separate follow-up patch for that.

Regards,

Hans


