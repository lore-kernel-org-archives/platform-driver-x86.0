Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c0hOzhRj"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D6CBF3
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Dec 2023 01:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702286161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jUybIe9KqFLYcWP/O6bBcrUunOZCGQTAWb7qxrL5p9o=;
	b=c0hOzhRj56jZ0R5uFHLyphEcqNwKfck7a3osmETEwaT3WlELrO2rs+mL3pvOmRAB6l8as8
	jRg1N/NzNkQ3eEcXXUqbxzypFa0DOF/bSWCb/JV7kArQXoc46ZMZDSRpMNaJihNp6gKGz2
	zvG//leETwx1LY4LluEbSGNfHskjsIw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-nRrHysUYPbqB7T9lnrTZrQ-1; Mon, 11 Dec 2023 04:15:59 -0500
X-MC-Unique: nRrHysUYPbqB7T9lnrTZrQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a1cfd84b473so474451766b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Dec 2023 01:15:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702286158; x=1702890958;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUybIe9KqFLYcWP/O6bBcrUunOZCGQTAWb7qxrL5p9o=;
        b=QlDg6/eHAZBWmvpLCAkS5Q9LQdhKDD4K74Ao6wlLNISsbgJPbW5VZH9SEoaCjZzY2z
         hrCGeOHBXNhJOU/1CTH8JkXwfDDR1XZDQje5CvsE1hPktMdoWxlnmK+r3t60ycRhu1iZ
         RG6U8xdrqmNlFPMGfTOtOodTagE5ArwFgnLmALYwh6thBWsWvsTbfsMEpAyvQlBTaxjX
         GNbjKe1Th3fELNu9SlQuRrVM7m3VoGhB1qeVbLa+Mlap3Apmc3PlnriCxnYavrxbnGdH
         +lisU8OaYeqzgtyVl44ucn+RpgtdlAryOQjt/ZSnmDO216V6ueXUI1sEd5hE0RK8cyRA
         4jrA==
X-Gm-Message-State: AOJu0YwQqvPqkcULM3YTI2KuZCNYBVuPM8yTYqisbxMdHD0jRsEqxjDe
	QdL7Pku6eRRSc3XjQ6XUjFKvrYtUH3MSY8h7vLy/vTMjSNUBIsT71dEdDY2rsESEXnfG716Mb9X
	3xoETFm9T8IKg48Z/HNCy08ZTzu6QK4KmHQ==
X-Received: by 2002:a17:906:d8b7:b0:a1e:9373:155d with SMTP id qc23-20020a170906d8b700b00a1e9373155dmr3875677ejb.30.1702286158645;
        Mon, 11 Dec 2023 01:15:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGW1e+waL/QAdSpSyUmPOaSmsPd59r49OwBNwRqu8vficgePrUyWjV5v7UzdONOfkjFDQt5Ng==
X-Received: by 2002:a17:906:d8b7:b0:a1e:9373:155d with SMTP id qc23-20020a170906d8b700b00a1e9373155dmr3875668ejb.30.1702286158309;
        Mon, 11 Dec 2023 01:15:58 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id tz9-20020a170907c78900b00a19afc16d23sm4518226ejc.104.2023.12.11.01.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 01:15:57 -0800 (PST)
Message-ID: <ad064333-48a4-4cfa-9428-69e8a7c44667@redhat.com>
Date: Mon, 11 Dec 2023 10:15:56 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/15] platform/x86/amd/pmf: Add PMF-AMDSFH interface
 for ALS
Content-Language: en-US, nl
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
 ilpo.jarvinen@linux.intel.com, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
References: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
 <20231204101548.1458499-16-Shyam-sundar.S-k@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231204101548.1458499-16-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/4/23 11:15, Shyam Sundar S K wrote:
> From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> 
> AMDSFH has information about the Ambient light via the Ambient
> Light Sensor (ALS) which is part of the AMD sensor fusion hub.
> Add PMF and AMDSFH interface to get this information.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  6 ++++++
>  .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 19 +++++++++++++++++++
>  drivers/platform/x86/amd/pmf/spc.c            |  9 ++++++++-
>  include/linux/amd-pmf-io.h                    |  4 ++++
>  5 files changed, 38 insertions(+), 1 deletion(-)

Ok so with this patch also added in the mix I guess the
multi-plexing nature of amd_get_sfh_info() makes sense,
so it is ok to keep that.

But this patch also needs to have its HID parts split out
from the rest and the HID patches need to be merged
separately.

Since the merge-window is getting close I would like
to propose the following:

1. Send a v7 addressing review remarks consisting of
only patches 1-12, assuming all review remarks are
fixed in v7 I can merge that then.

2. Send a 3 patch HID patch series separately:

[PATCH 1/3] HID: amd_sfh: rename float_to_int() to amd_sfh_float_to_int()
[PATCH 2/3] HID: amd_sfh: adding the HID hpd bits + amd_get_sfh_info() function
[PATCH 3/3] HID: amd_sfh: adding the HID als bits

3. Once v7 of patches 1-12 + hopefully the 3 patch HID series have
landed in 6.8-rc1 then I would be willing to take a patch using
amd_get_sfh_info() to implement hpd + als support in the spc code
as a fix for 6.8-rc# .

Regards,

Hans

