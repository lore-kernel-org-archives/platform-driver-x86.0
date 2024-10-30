Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662711EC000
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Oct 2024 13:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730295691; cv=none; b=JALWwXa4wPDHsMnxilc93ppw/97q37RMlU+da8JnFE9pa1UoJr1rGQHAbMT8EotEoiPQ38L63YSkV0jTzxsqzp04jbDJt25igp7gXIPjtNSOXFn4pA8A1WMMcvlesX+e2uOhM3jpumXZyZKWk/wczro/9lcdWNUIMMc50ta/JWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730295691; c=relaxed/simple;
	bh=2B5Ia70QWSyxCyjXEfvbfDL7WJs6J1nxOhpTZUF1ERM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BTwpXUipMzB9Fw1uEZ+0WGQfQQgXDIyLSAE/WTL+oDjAnTQsAA2foK5mR3lpZVmHhZ9nf/oi6zETFaokCZqWbRaLnkb5a2uGqpEvJoH7w8L76L7xNwdlCTGrQT6l9Tv/kFdVADL1dB0VzjEhM01pwHlYr24qo2odbbDIPkeS0kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MnTaMswp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MnTaMswp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730295688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lEqCXp1zzf8LQ1zW1l4BdUOYON0z7P059fI6PC8eKkY=;
	b=MnTaMswpOwJXoGEAXib31M/Eq7Bt829MMn41sXnyxOF6dSV9bOktDSvodTvRSTrcucOdPH
	F7c/FSSvFxjMDm8wwXfGtYzAao49TZyKO4KM8FhLtlZrBAxjaWAEFzvqW0zt+1EPjeUiOb
	HsBncyk9j4OFmxdnHpYVqOLrfjhRTDw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-Ghai0Z01PQipN7C0IZWUag-1; Wed, 30 Oct 2024 09:41:27 -0400
X-MC-Unique: Ghai0Z01PQipN7C0IZWUag-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a9a1e429a8fso145332266b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Oct 2024 06:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730295686; x=1730900486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lEqCXp1zzf8LQ1zW1l4BdUOYON0z7P059fI6PC8eKkY=;
        b=VD1W4cWtjEF1QUqmMUJd/fSzogdU/YrHjwBzcPulwkkKpqxmWDBRwbVWHsPzFV1Iqw
         Q//p80U6EiYINCWxiqoX2OTMMuBMg3tICv96YhD7ddCxnOxHl6LbcX7urP1tdr/3rgY5
         iD8TroT3z+2TdF/tNWTFLsCT3EZUkng00YFGPO7Hi6V7AaAvLVL0pcImSwQDUc5uN7SP
         9Bl1frE1UZxDxc5BtKNqu3KxgEpKlOxc/U6vkM28P6BCbhwANaIdpGrjKdBwegoZa+Rp
         tu8U4WbjnHKaEWyh+ZvCsp3XB22qaNJmkhwy+zILD0TEoKbiWI402t1IMGvvoNc5nKei
         U1Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWM70Uf+bD0sdXUX7BcUic2UI0g7jwYprx4Iv9l5a2/3pO+9+r2bINvlWNe8QaM/npfhF1NTRw67bvJY/Dsc2C7E2Ln@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/vBI3CJo0yctBDKrEyfvc6UGy993GE0xoLkmuk0LrmLuzEQFt
	MOD7Bf8lzhqyHuyRr82rf4itiKURylcYNbhMxLoqiwOxHvf4lYV+24qfkwMmEW42r9wgouHVWtw
	OgofQhazShcEU0nK8vjFLr2NGMEUD7jO1rQrKHBCUJhcvqmvdLRPU2EghO9m3hP9pey+ZPss=
X-Received: by 2002:a17:907:86a5:b0:a9a:6847:e82c with SMTP id a640c23a62f3a-a9de5d95e17mr1437915666b.15.1730295685784;
        Wed, 30 Oct 2024 06:41:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/rdw+jYEnis344grPffbYAyM8RixmJ8zHSQVK9MbS3tzd1IDtYf02RcIzlI27fi3JRB64Lg==
X-Received: by 2002:a17:907:86a5:b0:a9a:6847:e82c with SMTP id a640c23a62f3a-a9de5d95e17mr1437910866b.15.1730295685313;
        Wed, 30 Oct 2024 06:41:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f029564sm574219766b.51.2024.10.30.06.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 06:41:24 -0700 (PDT)
Message-ID: <3e0064cb-b8cc-4126-aa4f-92cd4a676937@redhat.com>
Date: Wed, 30 Oct 2024 14:41:23 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] Add support for binding ACPI platform profile to
 multiple drivers
To: Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>, Lee Chun-Yi <jlee@suse.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Ike Panhc <ike.pan@canonical.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Alexis Belmonte <alexbelm48@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ai Chao <aichao@kylinos.cn>, Gergo Koteles <soyer@irl.hu>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 "open list:MICROSOFT SURFACE PLATFORM PROFILE DRIVER"
 <platform-driver-x86@vger.kernel.org>,
 "open list:THINKPAD ACPI EXTRAS DRIVER"
 <ibm-acpi-devel@lists.sourceforge.net>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 Matthew Schwartz <matthew.schwartz@linux.dev>
References: <20241028020131.8031-1-mario.limonciello@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241028020131.8031-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mario,

On 28-Oct-24 3:01 AM, Mario Limonciello wrote:
> Currently there are a number of ASUS products on the market that happen to
> have ACPI objects for amd-pmf to bind to as well as an ACPI platform profile
> provided by asus-wmi.
> 
> The ACPI platform profile support created by amd-pmf on these ASUS products is "Function 9"
> which is specifically for "BIOS or EC notification" of power slider position.
> This feature is actively used by some designs such as Framework 13 and Framework 16.
> 
> On these ASUS designs we keep on quirking more and more of them to turn off this
> notification so that asus-wmi can bind.
> 
> This however isn't how Windows works.  "Multiple" things are notified for the power
> slider position. This series adjusts Linux to behave similarly.
> 
> Multiple drivers can now register an ACPI platform profile and will react to set requests.
> 
> To avoid chaos, only positions that are common to both drivers are accepted.
> 
> This also allows dropping all of the PMF quirks from amd-pmf.
> 
> v2:
>  * Split to many more patches
>  * Account for feedback from M/L

Thank you for the new version. I just did a quick check of
patches 8 - 13 and this looks much better.

I see from various discussions that a v3 is incoming so I've
not done a full review of patches 8 - 13.

Regards,

Hans





> 
> Mario Limonciello (15):
>   ACPI: platform-profile: Add a name member to handlers
>   platform/surface: aggregator: Add platform handler pointer to device
>   ACPI: platform_profile: Add platform handler argument to
>     platform_profile_remove()
>   ACPI: platform_profile: Add a list to platform profile handler
>   ACPI: platform_profile: Move sanity check out of the mutex
>   ACPI: platform_profile: Use guard(mutex) for register/unregister
>   ACPI: platform_profile: Only remove group when no more handler
>     registered
>   ACPI: platform_profile: Require handlers to support balanced profile
>   ACPI: platform_profile: Notify change events on register and
>     unregister
>   ACPI: platform_profile: Only show profiles common for all handlers
>   ACPI: platform_profile: Set profile for all registered handlers
>   ACPI: platform_profile: Make sure all profile handlers agree on
>     profile
>   ACPI: platform_profile: Check all profile handler to calculate next
>   ACPI: platform_profile: Allow multiple handlers
>   platform/x86/amd: pmf: Drop all quirks
> 
>  drivers/acpi/platform_profile.c               | 258 +++++++++++-------
>  .../surface/surface_platform_profile.c        |   7 +-
>  drivers/platform/x86/acer-wmi.c               |   5 +-
>  drivers/platform/x86/amd/pmf/Makefile         |   2 +-
>  drivers/platform/x86/amd/pmf/core.c           |   1 -
>  drivers/platform/x86/amd/pmf/pmf-quirks.c     |  66 -----
>  drivers/platform/x86/amd/pmf/pmf.h            |   3 -
>  drivers/platform/x86/amd/pmf/sps.c            |   3 +-
>  drivers/platform/x86/asus-wmi.c               |   5 +-
>  drivers/platform/x86/dell/dell-pc.c           |   3 +-
>  drivers/platform/x86/hp/hp-wmi.c              |   3 +-
>  drivers/platform/x86/ideapad-laptop.c         |   3 +-
>  .../platform/x86/inspur_platform_profile.c    |   5 +-
>  drivers/platform/x86/thinkpad_acpi.c          |   3 +-
>  include/linux/platform_profile.h              |   4 +-
>  15 files changed, 190 insertions(+), 181 deletions(-)
>  delete mode 100644 drivers/platform/x86/amd/pmf/pmf-quirks.c
> 

