Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EAB17DE36
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 13:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723470751; cv=none; b=pm8F30SNii8yzG0w25r7KL3IWTMOlx5V3G7s1ao4zJHpHrbFk58ObOzxouiNgPvVOc+zT4Ftpkqp98tuM1DQEw1t4aiNviy7H7rrM3Y62uOYT3Dhaq5We59hmQznBLKMd1H1brUHKP6iYW/1D3Pg2rKhn52RAO6RgPEdVRZDvUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723470751; c=relaxed/simple;
	bh=U+oTwlABO4oBXd7EEjBWj1WtDC61J7PYbNmt7uiSfe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ibq+q52x6JgVCHMj1BNr47XRlShwKVxKRY4rlR3A2TwYFqwN1H986oc0d9QaG3WznoitWzlX6lZzm/Vh9+LLhVgoikVoaou0w8lmvg/w6qaiTLhoOU44UFJiuz1ARzIO50ukyeW7EfjwSBNzjnG7+A+wP2GghZI6KDfLca9HdUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gw7Rwufo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gw7Rwufo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723470748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sd85iCuzkiaHIi9ARC/ZdPTz7M5ce5CxfGu9LxDUHcU=;
	b=Gw7RwufonbwRMA6SUcr+E827UR12iTf5Xta2n1TaEN7oFVSPQ6VuchuFLP3OkB8I4N0Rj0
	UcDzGe7dJrcYJnpZrRDXrRpKubqWz9r0aXtGrnS0dys8rUYkw3I20z+DUBcDykdRt4sw8F
	SyJzpyu6fVmen6KExfm2oJBb00rokg8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395--H74DW7gNQO6i2I5uGDv7g-1; Mon, 12 Aug 2024 09:52:27 -0400
X-MC-Unique: -H74DW7gNQO6i2I5uGDv7g-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5a49935bda6so3300920a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 06:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723470746; x=1724075546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sd85iCuzkiaHIi9ARC/ZdPTz7M5ce5CxfGu9LxDUHcU=;
        b=UhlsOptcYj5DMOilJn1wRnYMiMzNIKcN0maq8MLUJxYH2dSffEMDm49nA2TQc2fnfn
         AXGMehqs2FBiVvRBSseNV0IJ8/wUkawaPT1x6p9YIaRHLiCo367ZyZyEfdOGvVxLo652
         zYY48HyHsVPvnHt1wlhtGO8Zgy0sBN84MeG0cbx/6W815FEAf+AgK1yIN+2aquYO6AKH
         Wf9W6eATNmCUcT4vnerP9pQ2N0848k8wykvpZ+OOJppvytknUhiNg2jCU7ZYNyiU9YeY
         aTVfKzKemmEOpU7cvkmt+Cxj4+azvFQh1vFVsTGBw2cEhgqKcaymcb/VoPe5WBq9DKts
         5qvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdER1LTE0vxQjWyDVi4tiyN9ob7tvla+gjQOGvnoHsYdSB1n7S/+14QwRHfQpS1eyvsz79QLVbgLa5DzREAVVGH4CPerjLf/EMTBfFVTvmRlauHw==
X-Gm-Message-State: AOJu0YwSBnpIQHJUg9Gs2kyaIpTbHDZffWxeT0nr1AnjoFl2af1bm3Ll
	2845+Pud6X1wp+S817cr19gd45COUTxC7u9xwKYBznUedBLFdjTFV0UArHh1E2OkmqiWrmp8ACE
	zvE3hWta+Gf2zD5mh+1RrmzdYvVeOiU2eaTkBpzL3KKruPZAFYkrfsdTa2gjAZMqPHLzo3zA=
X-Received: by 2002:a05:6402:2113:b0:5a1:25a5:5dde with SMTP id 4fb4d7f45d1cf-5bd44c38786mr245161a12.17.1723470746028;
        Mon, 12 Aug 2024 06:52:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxC+wbLxyAluaepNv7rHIg3aENCbMAyBR986wmaPBQbxdXUVRX4wQrPV3+hHy+P3YyLGM58A==
X-Received: by 2002:a05:6402:2113:b0:5a1:25a5:5dde with SMTP id 4fb4d7f45d1cf-5bd44c38786mr245140a12.17.1723470745478;
        Mon, 12 Aug 2024 06:52:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd191a1e8esm2123978a12.37.2024.08.12.06.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 06:52:25 -0700 (PDT)
Message-ID: <13d93f79-1209-4071-bf4e-a70703a9a400@redhat.com>
Date: Mon, 12 Aug 2024 15:52:24 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86:dell-laptop: Add knobs to change battery
 charge settings
To: Armin Wolf <W_Armin@gmx.de>, Andres Salomon <dilinger@queued.net>,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>,
 Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pm@vger.kernel.org, Dell.Client.Kernel@dell.com
References: <20240720012220.26d62a54@5400>
 <148efb2f-ef26-4759-98d3-5f6687c3cf12@redhat.com>
 <c11ba6f5-5e7d-463d-9b1a-d2e56de21af9@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c11ba6f5-5e7d-463d-9b1a-d2e56de21af9@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 7/29/24 6:41 PM, Armin Wolf wrote:
> Am 29.07.24 um 12:02 schrieb Hans de Goede:
> 
>> Hi,
>>
>> On 7/20/24 7:22 AM, Andres Salomon wrote:
>>> The Dell BIOS allows you to set custom charging modes, which is useful
>>> in particular for extending battery life. This adds support for tweaking
>>> those various settings from Linux via sysfs knobs. One might, for
>>> example, have their laptop plugged into power at their desk the vast
>>> majority of the time and choose fairly aggressive battery-saving
>>> settings (only charging once the battery drops to 50% and only charging
>>> up to 80%). When leaving for a trip, they might want to switch those
>>> settings to charge to 100% and charge any time power is available;
>>> rebooting into the BIOS to change those settings is a hassle.
>>>
>>> For the Custom charging type mode, we reuse the common
>>> charge_control_{start,end}_threshold sysfs power_supply entries. The
>>> BIOS also has a bunch of other charging modes with varying levels of
>>> usefulness, so this adds a new Dell-specific sysfs entry called
>>> 'charge_type' that's documented in sysfs-class-power-dell (and looks a
>>> lot like sysfs-class-power-wilco).
>>>
>>> This work is based on a patch by Perry Yuan <perry_yuan@dell.com> and
>>> Limonciello Mario <Mario_Limonciello@Dell.com> submitted back in 2020:
>>> https://lore.kernel.org/all/20200729065424.12851-1-Perry_Yuan@Dell.com/
>>> Both of their email addresses bounce, so I'm assuming they're no longer
>>> with the company. I've reworked most of the patch to make it smaller and
>>> cleaner.
>>>
>>> Signed-off-by: Andres Salomon <dilinger@queued.net>
>> Thank you for working on this and it is great to see the discussion
>> to improve the code between you and Pali going on.
>>
>> One concern which I have is that work is underway for both upower
>> and GNOME to add support for
>> /sys/class/power_supply/*/charge_[start|stop]_threshold
>>
>> to gnome-control-center.
>>
>> But if I understand things correctly then these limits will only
>> be honored when the charging-type is set to custom.
>>
>> So we need to do something to avoid userspace exposing those
>> controls when the charging-type is not custom.
>>
>> I think it would be best to not have the charge_[start|stop]_threshold
>> attributes visible when the charging mode is not custom.
>>
>> Regards,
>>
>> Hans
> 
> Hi,
> 
> the documentation of the "charge_type" sysfs attribute states that:
> 
>     "Custom" means that the charger uses the charge_control_* properties as
>      configuration for some different algorithm.
> 
> So i believe that "charge_[start|stop]_threshold" attributes should not be unregistered
> if "charge_type" is not "Custom" because:
> 
> 1. The power supply subsystem does not allow that for power supplies, and i see little
> reason to deviate from this behavior here.
> 
> 2. It is the responsibility of userspace to also set "charge_type" to "Custom" when using
> the "charge_[start|stop]_threshold" attributes.
> 
> Maybe we could clarify what happens when "charge_[start|stop]_threshold" is written without
> "charge_type" being "Custom". This might help userspace to correctly switch to custom charging
> and set the charging thresholds.
> 
> Basically, we could define that writes to "charge_[start|stop]_threshold" will get buffered by
> the driver if two conditions are met:
> 
> 1. "charge_type" is not "Custom".
> 
> 2. The hardware does not support setting the charging thresholds when "charge_type" is not "Custom".
> 
> Userspace can then first set "charge_[start|stop]_threshold" and then switch to custom charging.
> This prevents any problems should the hardware have no default value for the charging thresholds
> when switching to custom charging for the first time.

Ah I did not realize this was already documented in this way. Yes if this is
already documented this way then the driver does not have to do anything.

Instead userspace consumers of the "charge_[start|stop]_threshold" user should
check (and if necessary / if they want to set) "charge_type" = "Custom" on
power_supply class devices which have a charge_type.

Regards,

Hans


