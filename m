Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934D41EEE0
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Aug 2024 14:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683742; cv=none; b=t/LYONaHsiYUTOJhzrn+ADuSx2Ui14H5T7v5fB8QcldHs2VU0Yd65MVhGvTbQ1T12k/mSWuokSLEe2HYuNU6Co4HeQPhkZDcF+cX5e8acQAb7dpwpSGIzQkslTbhnf/5SEzTcgSHqSZofVoJTvB2954nHR9xMLpX0LabUHQ+uoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683742; c=relaxed/simple;
	bh=HyX0Ze5QaXmxGELMZYgDFfeGjg2lC9muxsWXetl7eUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZgeMpMEFwihYW1aZ4EoiP6xopn19m9LGlaooyhPBFe7gYs8kHmlz6YvNwMRmpSYP7JZYjJk6tal/NGayTRJ1Q1O2w24otHIInHi8+pkBnP3b2XvL2crqKMcCyuhwgBkwXvHkaRJWf9NPmM+0ST6ZVuwYyKXoKyzX5g3lnw9KimQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wv4n/Lo+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wv4n/Lo+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724683739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UHaPjQf82fzJdve1/EL5HTCFbbWYrAUYnTsv/W9AQv4=;
	b=Wv4n/Lo+bYQ7B04jzkd5l5LFC+HWf2zwb2hrbmiSOKaZvfvHKZnmfGY5S1GEqKGvjOEIdn
	Nim8C2IwstPc1YZ9HMRAfXeqyqxZvXts29YLerJBsCb3B39uFC4uJjPSUps/Mog3kNlDAB
	onqY4CE0DdI8oMdK1IKoimCnzxOdlkI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-uPROdneeNsiw2788RrHCAg-1; Mon, 26 Aug 2024 10:48:58 -0400
X-MC-Unique: uPROdneeNsiw2788RrHCAg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a8683751595so370653066b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Aug 2024 07:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724683736; x=1725288536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UHaPjQf82fzJdve1/EL5HTCFbbWYrAUYnTsv/W9AQv4=;
        b=jxmPHqbs0d/Djo1wG7WCtdVandWw4j9f5CnLkJ+KekGVufDlZZINajSS+uKXCLnrRJ
         Xo6G5+j4qAR0Vz6pjxHV+nc6fZDiD4YMS09OeaKJgIeBUMQaERx6tHdaHSAS2aAMfAuM
         AvO5UI5gppborqsJAo84PaBJcLDQBEUAcarsSX6/vE1lGPeK8p73GDW4x/wrTgC4XZ4p
         tqwLslvtIZTrPW1T/ePij2ImDKw+dHBFSwo06da+wAxSsyxwvXTCuY8ziLIHEpjRjCNM
         K5V8Xu/Se7KCyLKi98fgj1x0DLNdpy4yC1qyEoPW+WE577dFvrIQiNtPaJsgzSTbLx2b
         tvXA==
X-Gm-Message-State: AOJu0YwE4iF802a07EbMjkVM9DRn+3+UI9230a5dPjYqTqMqNzepEDB/
	D3wVRCZpYGqJhUquXY62/Vtp2GqzgrW8FWtOm1xRvY4sJUTd23Y4WkXIGbIYXSuUrjwo5LYrN4N
	y88tHYzzFWH9P0xKGVdNnhJEHqDRhDhZJabWrr5o/lqvb+O+ctjgvPCgluduSW8tbu8EoXOBM+b
	gJPG0xcg==
X-Received: by 2002:a17:906:f5a8:b0:a7d:a00a:a9fe with SMTP id a640c23a62f3a-a86a52b5d88mr747022066b.17.1724683736470;
        Mon, 26 Aug 2024 07:48:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ3oqNtMuoPDoeje2TW7QJXT5PrJA7ZTz1Cf6GJ/Y8fhh9JelE55xJ8f5WD2PBSFo7uTddTQ==
X-Received: by 2002:a17:906:f5a8:b0:a7d:a00a:a9fe with SMTP id a640c23a62f3a-a86a52b5d88mr747020166b.17.1724683735978;
        Mon, 26 Aug 2024 07:48:55 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4378f3sm675503066b.132.2024.08.26.07.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 07:48:55 -0700 (PDT)
Message-ID: <8c568307-06f8-46a6-812c-407d7b1dd695@redhat.com>
Date: Mon, 26 Aug 2024 16:48:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/intel-uncore-freq: Do not present
 separate package-die domain
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240820204558.1296319-1-srinivas.pandruvada@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240820204558.1296319-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/20/24 10:45 PM, Srinivas Pandruvada wrote:
> The scope of uncore control is per power domain with TPMI.
> 
> There are two types of processor topologies can be presented by CPUID
> extended topology leaf irrespective of the hardware architecture:
> 
> 1. A die is not enumerated in CPUID. In this case there is only one die
> in a package is visible. In this case there can be multiple power domains
> in a single die.
> 2. A power domain in a package is enumerated as a die in CPUID. So
> there is one power domain per die.
> 
> To allow die level controls, the current implementation creates a root
> domain and aggregates all information from power domains in it. This
> is well suited for configuration 1 above.
> 
> But for configuration 2 above, the root domain will present the same
> information as present by power domain. So, no use of aggregating. To
> check the configuration, call topology_max_dies_per_package(). If it is
> more than one, avoid creating root domain.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
> This is a forward looking change as TPMI is architectural and should
> support all topologies.

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> 
> v2
> Updated commit description as suggested.
> 
>  .../x86/intel/uncore-frequency/uncore-frequency-tpmi.c     | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
> index 2016acf44f6a..e6047fbbea76 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
> @@ -557,6 +557,9 @@ static int uncore_probe(struct auxiliary_device *auxdev, const struct auxiliary_
>  
>  	auxiliary_set_drvdata(auxdev, tpmi_uncore);
>  
> +	if (topology_max_dies_per_package() > 1)
> +		return 0;
> +
>  	tpmi_uncore->root_cluster.root_domain = true;
>  	tpmi_uncore->root_cluster.uncore_root = tpmi_uncore;
>  
> @@ -580,7 +583,9 @@ static void uncore_remove(struct auxiliary_device *auxdev)
>  {
>  	struct tpmi_uncore_struct *tpmi_uncore = auxiliary_get_drvdata(auxdev);
>  
> -	uncore_freq_remove_die_entry(&tpmi_uncore->root_cluster.uncore_data);
> +	if (tpmi_uncore->root_cluster.root_domain)
> +		uncore_freq_remove_die_entry(&tpmi_uncore->root_cluster.uncore_data);
> +
>  	remove_cluster_entries(tpmi_uncore);
>  
>  	uncore_freq_common_exit();

