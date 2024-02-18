Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0649914A86
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Feb 2024 10:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708251941; cv=none; b=cMgkxPL2cD5wS1MqfK2sMxnaVrFN2wrxDgvE7b6x/YNh9FCCZEAdvzNBphphRcDRswQdR/k2wYhoq4qM9Ip60ldNEzG6tAlYZYM2kw8x0DEPmnkNBzMIVkWXhMRUsIQRsxZ+poaPjibt3xE1yeFyqRkP615THJgXzIZTGCkIYGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708251941; c=relaxed/simple;
	bh=dGdK/7OpzGH/JEk5GC2hmKc2axQNcFvbMof4vjm8zKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EMTpaKq1UE5Q0jQt1yZUgNXICm1p9Sy8vdhMuNUT958qEU9rH7+r8+GnwEYBxxte8Mrr3ahf5nVm/X+7rNS9VNQxuUjnpXsiUqXRJRZ7eBCWV6UEVfXq76sKb+gtGTgIJO7CMQjMw0Tp3MG5vA8CmKfuR19G64T4btNi3weeHvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i5VI4pxX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i5VI4pxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708251938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2iEVaLk4akMDHkeP1ZaWpWjQZCn8kWWlifWh8Zg5QIY=;
	b=i5VI4pxX9Ej41goqpd7P/TUu359yMUejS4fwB96jFmINDJ7JCdFXXyTQTkxoBgKLsEfIs0
	zOLQhc2lgQtzAAt4dkOnp+gII5fx+oLu6tcvAA3EUnurKI2o6mDVDFKZs2WYHGfdHma4mJ
	8gKEI8PI0xOiKUPRxr8IjMh0dRbNvQk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-FgMq1dfkN3S2HGyFfMRT0Q-1; Sun, 18 Feb 2024 05:25:37 -0500
X-MC-Unique: FgMq1dfkN3S2HGyFfMRT0Q-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a3158fbb375so116967966b.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Feb 2024 02:25:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708251936; x=1708856736;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2iEVaLk4akMDHkeP1ZaWpWjQZCn8kWWlifWh8Zg5QIY=;
        b=SQteNugK1QylK3wt5Bt1ajVcoIZCp1FtDiEmx/+08ZN6Gwlrlv4owb4U/QqEHcE465
         oTYntOGCAuooLwUtSyUMG93rvsFWVp84K6FLFh3WvhjOFKOCUHdJvOqxzYU/b3QsJSJy
         4rayuYHi2Xt5Vyc6v8gMBrFRoJpOri3f8Dbm4TCcCvEnpGjUX7qyMLfPnjLTuk8SAFBq
         1wLwnAR/PBAmZuJql3yr/7to53DrVMX+Bz0zONJoQffMtaR6PX2tzqKaQH3UbBoZYhal
         WwaTmphY86pFTbQAZ1o3kUiu8SLg31zqj+J/ezp8NOQwzS7ny9XyPRJp9M6W0t/zy0AD
         Wjhg==
X-Gm-Message-State: AOJu0YyU/FOFT+nc0dDTfVgsfSVOsVXePbY1qhjqF37QJYfrClp4RTWt
	Qc9yeQ1QL+Xid8n9iF17a4+Wfa2QcCWnxhWNSXuHKfbZNo2aB2DjQwtedd6FXnnYqG2m45J4xYI
	uOdWyE1X11HdR9DWpWYA6ISgB8J/IKliNZWwWOki8kDVHzW9iqUIPlxxJzPA4Ld33MUnYbNJk0g
	kVbmw=
X-Received: by 2002:a17:906:3e09:b0:a3d:1cdf:19eb with SMTP id k9-20020a1709063e0900b00a3d1cdf19ebmr6026847eji.11.1708251935868;
        Sun, 18 Feb 2024 02:25:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiw7bvH2CfflWMR+lbNA5sJ0keSNtvle/bLFtz5dXzyNCEfVrpI77daeX8ROI9yC38fM6hxg==
X-Received: by 2002:a17:906:3e09:b0:a3d:1cdf:19eb with SMTP id k9-20020a1709063e0900b00a3d1cdf19ebmr6026843eji.11.1708251935646;
        Sun, 18 Feb 2024 02:25:35 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id un1-20020a170907cb8100b00a3d5a08ccc1sm1812528ejc.191.2024.02.18.02.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 02:25:35 -0800 (PST)
Message-ID: <2969e76d-1505-4122-959b-ee92b887ea7a@redhat.com>
Date: Sun, 18 Feb 2024 11:25:35 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] platform/x86/amd/pmf: Fix TEE enact command
 failure after suspend and resume
Content-Language: en-US, nl
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 mario.limonciello@amd.com
References: <20240216064112.962582-1-Shyam-sundar.S-k@amd.com>
 <20240216064112.962582-2-Shyam-sundar.S-k@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240216064112.962582-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/16/24 07:41, Shyam Sundar S K wrote:
> TEE enact command failures are seen after each suspend/resume cycle;
> fix this by cancelling the policy builder workqueue before going into
> suspend and reschedule the workqueue after resume.
> 
> [  629.516792] ccp 0000:c2:00.2: tee: command 0x5 timed out, disabling PSP
> [  629.516835] amd-pmf AMDI0102:00: TEE enact cmd failed. err: ffff000e, ret:0
> [  630.550464] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_RESPONSE:1
> [  630.550511] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_ARGUMENT:7
> [  630.550548] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_MESSAGE:16
> 
> Fixes: ae82cef7d9c5 ("platform/x86/amd/pmf: Add support for PMF-TA interaction")
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
> v2->v3:
> - No change
> 
> v1->v2:
> - remove enum smart_pc_status and adjust the code handling
> 
>  drivers/platform/x86/amd/pmf/core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 1d6dbd246d65..853158933510 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -296,6 +296,9 @@ static int amd_pmf_suspend_handler(struct device *dev)
>  {
>  	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>  
> +	if (pdev->smart_pc_enabled)
> +		cancel_delayed_work_sync(&pdev->pb_work);
> +
>  	kfree(pdev->buf);
>  
>  	return 0;
> @@ -312,6 +315,9 @@ static int amd_pmf_resume_handler(struct device *dev)
>  			return ret;
>  	}
>  
> +	if (pdev->smart_pc_enabled)
> +		schedule_delayed_work(&pdev->pb_work, msecs_to_jiffies(2000));
> +
>  	return 0;
>  }
>  

