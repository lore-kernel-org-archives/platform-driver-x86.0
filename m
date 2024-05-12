Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08102F873
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 May 2024 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715527528; cv=none; b=Lx12YMZGmtfSXPg+qB6zx30JVo7KVvkmMaeHukX+d98KhklAojMkgYMTTFj/l3/XlWV8GbbNcphoacdUS+zhhFZ7RCMVMQTwgAnySQUK1zV6W32izc+5EszwTUBIVEtEYp6hhUDRxXIvEAKKDkvXLtu+geaGBfg38UKTJ1gl8mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715527528; c=relaxed/simple;
	bh=RfLwX01/3WZpELU+1hMwbX8ioZ2ZPB6T+yvhcOFTJ/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=deVvCtd6+pNet9gfdZfEYEEHXs1GyeLdbHMF3UxE1Ughzu7aQ6d4FwipnE8KFDAczl8/FaAir0IPNtiikpMjMoKmseRkfjhJ+sYA4t09KeFa/NMDwlyERZPnWn4Z2PBHXdmKoji0Zb0thiVAXCTrMVrLbAM0Ppszre9JNAPsq4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jD5LEbrY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jD5LEbrY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715527525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=REXEqRClpHRev0wKw6MM0lA0UZQFaO1XDkvWqjxKpSs=;
	b=jD5LEbrY7uFF+Cxr/oD+d86VxVr4JzR569rTqe7mwQn/H4PN30T1A9iiZZJ9KSu/Neb/Er
	pXZJ5pNpgmFh7fBNj/2gh7gAew/9wqfIep6BlyWPA09vv27n1QnaSTh5D++hCST8e0Owxk
	sD5GGow423rM/RCXAmplcnbAKOkwxGg=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-0tEp_LT7OZyWpUKF0YULQw-1; Sun, 12 May 2024 11:25:24 -0400
X-MC-Unique: 0tEp_LT7OZyWpUKF0YULQw-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-51f6fb04b82so2940560e87.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 May 2024 08:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715527522; x=1716132322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=REXEqRClpHRev0wKw6MM0lA0UZQFaO1XDkvWqjxKpSs=;
        b=Q4jh1y3E/Uj+lrGFoar4GOMHVsdawMomEUbTepVH+oMDQMdWnZZnY8G1nJwfaZXp4/
         JbJ5DQ4lQU/BufjcxRDc3RUoVlD4XPeozWNDgH4X4q0BnK1oO8n6YOqaS3n2RfoabnF2
         m570HhftWT7kEauypFc48hIvZ2s2bffuLOCYvrJjUoQkv7aCaSl1+oolHovfM3u4qEXF
         sSYFGy0/Pg6Ks45OkAYzcEIDgPVIHURyNyrGu6UHSZn3eyTwrDWtFdbdF1cvkQ4jkbXb
         TW4y1LEOea+u0UvGYIniMV8RIlQXUdiQvVmLH6gr3UoQ5jVC7dGDx9zXS46EEyNpkg47
         DKVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw58wLpViKGTaU207bcFAx2CWBMlOEjLI1r48Nb0/IplT+wle2oFRKIU4L4oUxLnWG4LPGCg6hMwAKFT+wvG+AtUP/XP0ZPaPPd4BXNrDgjJ7Oxg==
X-Gm-Message-State: AOJu0YzkyNRu9bKPWcm3/lpjr6Mqv2/CC91SCNa2plIRFQGnBzCO1qZo
	R3+uPDKS86LoVkj2bnd/dNCs8t69GGs9tklTW6qMJYb9DZJ31Yic4OUQz8Sa9EYj/+jAKjAj+nw
	Y2XSC+MO91aWftDkGGlRS/JOLRbRyDSIlQqPLGontFCwkaFgwbwBsF1TFDLsdtuNwbTO2e5U=
X-Received: by 2002:a05:6512:310f:b0:51d:6660:e43 with SMTP id 2adb3069b0e04-5220ff746c8mr4705602e87.59.1715527522608;
        Sun, 12 May 2024 08:25:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL4+5i84D+bxhz3X4VH1waOivUquTPnysBNjyifN3WMq3+4sJUxIXZ9K4Rbsv97lME5t88Qg==
X-Received: by 2002:a05:6512:310f:b0:51d:6660:e43 with SMTP id 2adb3069b0e04-5220ff746c8mr4705584e87.59.1715527522075;
        Sun, 12 May 2024 08:25:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01647sm467000666b.160.2024.05.12.08.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 May 2024 08:25:21 -0700 (PDT)
Message-ID: <d12713a2-3b1a-47f1-8173-ec4d675021ec@redhat.com>
Date: Sun, 12 May 2024 17:25:20 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] platform/x86: dell-laptop: Implement
 platform_profile
To: "Limonciello, Mario" <mario.limonciello@amd.com>,
 Lyndon Sanche <lsanche@lyndeno.ca>
Cc: pali@kernel.org, W_Armin@gmx.de, srinivas.pandruvada@linux.intel.com,
 ilpo.jarvinen@linux.intel.com, lkp@intel.com, Yijun.Shen@dell.com,
 Matthew Garrett <mjg59@srcf.ucam.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Jonathan Corbet <corbet@lwn.net>, Vegard Nossum <vegard.nossum@oracle.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20240425172758.67831-1-lsanche@lyndeno.ca>
 <20240511023726.7408-4-lsanche@lyndeno.ca>
 <9ba4a500-9d88-4630-bd94-99f07dd51abe@amd.com>
 <B3AA4333-03DC-47D6-9519-7FA9496220E5@lyndeno.ca>
 <48JCDS.E4RT1F9DTKFU1@lyndeno.ca>
 <9b652a48-4107-4b68-9aea-6cfdf1e0e4fa@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9b652a48-4107-4b68-9aea-6cfdf1e0e4fa@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/12/24 3:43 AM, Limonciello, Mario wrote:
> 
> 
> On 5/11/2024 7:12 PM, Lyndon Sanche wrote:
>>
>>
>> On Sat, May 11 2024 at 09:59:17 AM -06:00:00, Lyndon Sanche <lsanche@lyndeno.ca> wrote:
>>> On May 11, 2024 9:16:56 a.m. MDT, "Limonciello, Mario" <mario.limonciello@amd.com <mailto:mario.limonciello@amd.com>> wrote:
>>>
>>>     On 5/10/2024 9:36 PM, Lyndon Sanche wrote:
>>>
>>>         index 6ae09d7f76fb..387fa5618f7a 100644 ---
>>>         a/drivers/platform/x86/dell/dell-smbios-base.c +++
>>>         b/drivers/platform/x86/dell/dell-smbios-base.c @@ -71,6 +71,7
>>>         @@ static struct smbios_call call_blacklist[] = { /* handled
>>>         by kernel: dell-laptop */ {0x0000, CLASS_INFO, SELECT_RFKILL},
>>>         {0x0000, CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT}, +
>>>         {0x0000, CLASS_INFO, SELECT_THERMAL_MANAGEMENT}, };
>>>     So when Alex checked on v5 that this doesn't load on workstations,
>>>     it has made me realize that doing this will block the interface
>>>     totally even on workstations. So I think there are a few ways to
>>>     go to handle this: 1) Rename dell-laptop to dell-client or dell-pc
>>>     and let dell-laptop load on more form factors. This would require
>>>     some internal handling in the module for which features make sense
>>>     for different form factors. 2) Add a new module just for the
>>>     thermal handling and put all this code into it instead. I don't
>>>     have a strong opinion, but I do think one of them should be done
>>>     to ensure there aren't problems on workstations losing access to
>>>     thermal control.
>>> A dell-client/laptop separation makes more sense IMO. I don't think keyboard control would belong in a the dell-client module either. Separating just thermal control would be easier, but not as clean I think. Thanks, Lyndon
>>
>> Thinking about it more, we can leave dell-laptop as-is and create a common dell-pc module that does not check for specific form-factors, assuming that is possible. Thermal management can be the first function to go in there.
>>
>> We will still block the calls from userspace regardless of which modules are loaded. If dell-pc fails because thermal management is not supported, we aren't losing anything by blocking that call anyway.
>>
>> Thoughts?
> 
> Sounds good by me.  So basically laptops will load both dell-pc and dell-laptop and workstations would load dell-pc.

Ack this sounds good to me too.

Regards,

Hans



