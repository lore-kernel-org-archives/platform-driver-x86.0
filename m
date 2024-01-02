Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19528101D5
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jan 2024 12:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OvMC8kB3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704199327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIqsFD74pfqLdhS2ZXd4ulK69eG+xBwuYxkv1BSeiUQ=;
	b=OvMC8kB3326rxjYK1l8twX9vgezCjugKMZIKWnqRzbrTqDH2kcF6BmgmVuqv9WxfJDMj24
	Lw3Q81me2XdCBh5UKsLPZ++KMPYDzb7yZAmXfzC3hE+pLly7/39cX0sPw0r2p7PLfats8a
	W4rsV+Bkg0gwgdPzYGSg1L6n8yhqZZ0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-V4ryt_1TMripn6sN_duFew-1; Tue, 02 Jan 2024 07:42:05 -0500
X-MC-Unique: V4ryt_1TMripn6sN_duFew-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2cce9488687so32670871fa.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Jan 2024 04:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704199324; x=1704804124;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UIqsFD74pfqLdhS2ZXd4ulK69eG+xBwuYxkv1BSeiUQ=;
        b=i88oqoYmh25e+C660wxK4gc90NzMnGBmgtlrt4kQ7hLKBxlhrEGOS06ZHy2uqBsWKy
         YDCjA41J/rvMghuyjiYJcl0ET2Z6MzZ+liavZpPkSqTbT8mUUjE2hN35KyAXPQpn2ZLY
         PHnGGiZ9t4vuzYeEKA/u46bkLgTd6VWO2rsE65xNYuR0wzQcysm2tYu86Jy7oOCcaDzM
         BFS+cw70qjrMcz43g4/v+P/X9cAMA6SGQsOI+bbK5iKo8t84puhnOckaAOyMgjWXIVMF
         M2g6bmoxXmgXZooZ73JrlbNCEHDMbgzSqM7skqgdWG2Zrytqm//KVnV457v4O7doXrcN
         nRzg==
X-Gm-Message-State: AOJu0YyxgAentxknicOYW85oS2yiVo92yQcyaRoqKh9O0aUv2ou3itbf
	Pdg/QnTXG8+aEhpizqCCQSW9gSz9Z3cnCwcFAqa2oC/sB34IqSu7saxAz7ZqhhJhoma837H0nH7
	NmSePyUs200MTs3ea6UfWJlQ9/JTJT5uB0cMqLh5IQQ==
X-Received: by 2002:a05:6512:398b:b0:50e:7fb4:ebaf with SMTP id j11-20020a056512398b00b0050e7fb4ebafmr5160792lfu.133.1704199324559;
        Tue, 02 Jan 2024 04:42:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcDg6qWWI1V7aSYWDe7r/vxonppIg9iQZvWdqvdi4Rc8Ghj0xol44xQFZ8VJ6as8iwIrzzpQ==
X-Received: by 2002:a05:6512:398b:b0:50e:7fb4:ebaf with SMTP id j11-20020a056512398b00b0050e7fb4ebafmr5160785lfu.133.1704199324376;
        Tue, 02 Jan 2024 04:42:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r9-20020aa7cb89000000b005550844cd1dsm9825716edt.30.2024.01.02.04.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 04:42:03 -0800 (PST)
Message-ID: <b1e29cf3-12d1-41ae-8994-ab245ff3dcff@redhat.com>
Date: Tue, 2 Jan 2024 13:42:03 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] platform/x86/amd/pmc: Updates to amd-pmc driver
Content-Language: en-US, nl
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: markgross@kernel.org, Sanket.Goswami@amd.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org
References: <20231228102104.1785383-1-Shyam-sundar.S-k@amd.com>
 <d4cf5063-faa8-a416-1fd-34cd52c1e90@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d4cf5063-faa8-a416-1fd-34cd52c1e90@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 12/29/23 14:47, Ilpo Järvinen wrote:
> On Thu, 28 Dec 2023, Shyam Sundar S K wrote:
> 
>> This series is focused on adding support for AMD family 1Ah series (or 
>> with platforms that support AMDI000A) that adds support for s2idle, VPE
>> IP block information, STB and idlemask.
>>
>> (Series based on 'review-hans' branch with "4fd8b09f5bc1" as the tip.)
>>
>> v1->v2:
>> -------
>> - Add missing smu_msg variable to amd_pmc_dev struct
>>
>> Shyam Sundar S K (6):
>>   platform/x86/amd/pmc: Send OS_HINT command for AMDI000A platform
>>   platform/x86/amd/pmc: Add VPE information for AMDI000A platform
>>   platform/x86/amd/pmc: call amd_pmc_get_ip_info() during driver probe
>>   platform/x86/amd/pmc: Add idlemask support for 1Ah family
>>   platform/x86/amd/pmc: Add 1Ah family series to STB support list
>>   platform/x86/amd/pmc: Modify SMU message port for latest AMD platform
>>
>>  drivers/platform/x86/amd/pmc/pmc.c | 25 +++++++++++++++++++------
>>  drivers/platform/x86/amd/pmc/pmc.h |  1 +
>>  2 files changed, 20 insertions(+), 6 deletions(-)
> 
> For all patches in this series:
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Shyam, thank you for the patches. Ilpo, thank you for the review.

I've applied the series to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

