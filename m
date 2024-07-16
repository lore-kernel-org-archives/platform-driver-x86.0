Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5999D195809
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jul 2024 09:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721121630; cv=none; b=nL+cT7/t6qwJ/mQ995KuQqVugdHTvj5lqRSZ1heerpyZ/fixsJvBdkkHv+TzVzizHK7EXGvTrFCxS97W62VIN+ba5SU60D1nG6axv56PsnlfosR2D29pcRJ/MZZzdKmp9ezhZuw3jd8zD7zJHifOpBQhx/FFP9Z6GqdxHQzWxGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721121630; c=relaxed/simple;
	bh=1/a/yfY0TjRJwxbZeY/ns27L44GCeG6929a15uNimF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MbMDjTRP5RJfbdkDkurOy76F3ZA1srIzNWzyjgk0BvJ5DuH1WMB+HXa+uh9cNS+4ikRyR+ub3QiJWpPJ2eKes95JVomhryn8qVyWjkH0gJMyktvEvR+2azALMOsY/iqW6R409HM1Fo3VYAUMsiIGoAFn3Sli39/WC1UA/6SwlC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S6h83RmS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S6h83RmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721121626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZdCPq+U46ySE0zyw6mUy09hUxN+0LCiqbk6pLbsUD44=;
	b=S6h83RmSOB/Qj8wOP8722nQGRlRJsnh4iDzGeqmWtfz1U0/UcEiLDShy7PPObEoCV0ohWs
	smorBnnpLRszxV/7sMWQJIFor+TO5bX1264Qj6vIgxhWu6yspykRuS3HhNj+U8+mfuauS7
	ADZ9XNnZ687iXB/hE79BOaYrS23hw8k=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-m_aD5legPyKnm_A1GF1L-Q-1; Tue, 16 Jul 2024 05:20:22 -0400
X-MC-Unique: m_aD5legPyKnm_A1GF1L-Q-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a77c5dfbd16so394526866b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jul 2024 02:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721121621; x=1721726421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdCPq+U46ySE0zyw6mUy09hUxN+0LCiqbk6pLbsUD44=;
        b=o2+DUM8K9cMfZx3dG6MyaqvlxzpY6hQqfdxYtU8wiE7kdwB0ZLgzhfAL0TE3o+LmM1
         ZfCWi9zVHNSVsz+jsqF0ZSsmmbutgxQ11yrnBZCgqdgHl6W8oM3cYh6TeV6ubnOfq0iC
         kNZ8s+0x3Rrzf7CBL5B3DNBmAiKVUHzxS0Fj6slQkoqVWYv1VAg0MJoG29zXaLQ8lrUV
         WE9MKcjTfn248VIZ5SEq1X2Eu1ZtGgR6MEy1ywORkoMZqyfLFzLkzUWwiDETUVsT3YG+
         pmxqJXRb4la62HtBoy/Jdb/Xz8y8XLrkqZQ/NQNsXPlfoqtRWFiJ2TWgSKHNHxJBjMSf
         vRvA==
X-Forwarded-Encrypted: i=1; AJvYcCWDu9WBoxFRuxpca+rHDZYH48lFF9oG9VaYM6ssz33nMmrha94EY22WnJqAzEBDtEEBPufKc6urTdXmFcWeVphWW9Rvrs3LfihW9Px052exZ04x7A==
X-Gm-Message-State: AOJu0YzpgKNT8GrzUY5LGqIQbppuOXZ9qYD8NCA1l5QRGjwB7X0nk6V4
	N59KlsMZTxtjRzquOwpJ21gP7cjhuEOZMHeqoqBpPz8bGAZMCHBnFHU389deGkx6gpOyRQqjW+7
	Aq6IJParB2TA5lQnKS8/Niq01tDKzCdJyih1TNAAAK62rEODfHsMJGQedZZ7VaxLUhZRDRrNS5x
	MgX5U=
X-Received: by 2002:a17:907:7b8d:b0:a6f:4e1f:e613 with SMTP id a640c23a62f3a-a79ea46d7c7mr116984966b.37.1721121620908;
        Tue, 16 Jul 2024 02:20:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/Q4gXbO33pY/K/+W8CI52EKCa4YRbHywZ2eE0EP0YYT2rgJqMwTnbQ9LovHqj4KSIV23TPQ==
X-Received: by 2002:a17:907:7b8d:b0:a6f:4e1f:e613 with SMTP id a640c23a62f3a-a79ea46d7c7mr116983666b.37.1721121620520;
        Tue, 16 Jul 2024 02:20:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5b7f00sm285964166b.63.2024.07.16.02.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 02:20:20 -0700 (PDT)
Message-ID: <8273ed57-4c65-41da-ad7d-907acf168c07@redhat.com>
Date: Tue, 16 Jul 2024 11:20:19 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] platform/x86: introduce asus-bioscfg
To: "Luke D. Jones" <luke@ljones.dev>, platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, linux-kernel@vger.kernel.org
References: <20240716051612.64842-1-luke@ljones.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240716051612.64842-1-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Luke, Mario,

On 7/16/24 7:16 AM, Luke D. Jones wrote:
> This is the first major patch I've ever done with the intention of
> introducing a new module, so it's highly likely I've made some mistakes
> or misunderstood something.
> 
> TL;DR:
> 1. introduce new module to contain bios attributes, using fw_attributes_class
> 2. deprecate all possible attributes from asus-wmi that were added ad-hoc
> 3. remove those in the next LTS cycle
> 
> The idea for this originates from a conversation with Mario Limonciello
> https://lore.kernel.org/platform-driver-x86/371d4109-a3bb-4c3b-802f-4ec27a945c99@amd.com/
> 
> It is without a doubt much cleaner to use, easier to discover, and the
> API is well defined as opposed to the random clutter of attributes I had
> been placing in the platform sysfs.

This is a bit of a novel use of the fw_attributes_class and I'm not
entirely sure of what to think of this.

The fw_attributes_class API was designed for (mostly enterprise)
x86 machines where it is possible to change all BIOS settings directly
from the OS without entering the BIOS.

Here some ACPI or WMI function is present to actually enumerate all
the BIOS options (which can be set this way) and get there type.

IOW there is not a static list of options inside the driver, nor
is there special handling in the driver other then handling differences
per type.

And if a new BIOS version has new options or a different machine model
has different options then these are discovered automatically.

This new use is quite different from this. Although I do see that
at least for the attributes using WMI_STORE_INT() + WMI_SHOW_INT()
that there is quite some commonality between some of the attributes.

I see how using the existing firmware-attributes class API definition
for this, including allow tweaking this with some of the fwupd
firmware-attributes class commandline util work Mario did is a useful
thing to have.

I guess using the firmware-attributes class for this is ok, but
this _must_ not be named bioscfg, since the existing hp-bioscfg
driver is a "classic" firmware-attributes drivers enumerating all
the options through BIOS provided enumeration functions and I want
the name to make it clear that this is not that. And the Dell
implementation is called dell-wmi-sysman so lets also avoid sysman
as name.

Maybe call it "asus-bios-tunables" ?   And then if Asus actually
implements some more classic firmware-attributes enumerable interface
we can use "asus-bioscfg" for that.

Mario, Ilpo what is your opinion on this ?

Regards,

Hans



