Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26EA14EC44
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 20:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711570990; cv=none; b=jpLGNQLIPLdsifeADF4/Gv0upcB/ydhWg6dHtBEKLzfjgCU6c1bWNtk/L2Qi6NS+nOIPLR8k451EwdUnQTfJjSpya4vZ8uM9p3sQb/dCEiXcSgLb1+KjilMZcMtP1DbksxXapTs6TiQknHsxUWCdUX0aDyx5PMjsIpUjtmGwuqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711570990; c=relaxed/simple;
	bh=gGFUEXzP38XKxA/VBY3QFi4X1MhaX2ie5+FhShTud+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TFcXruud407AJSod3JhQnKk3ie3ifXkiy3045d/M0ZPcEFytCK4lx8TcrXZACHwMn3R4DUqJEisS28QNp1UEOezysdYzoLIrFHXMqDHD5nG7ebYmzYtiFYd6H3/vNPrLakUlEqjuX6zE8Db69qaxEtH6roNOehqX2gzKPELh3s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C5eMVIev; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C5eMVIev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711570987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MSamWa+KJaP8I2QU1s273bisfEt0jWshOBi7xx7K3D0=;
	b=C5eMVIevmAZWYGvZyQ7KaK5K9K7mQRqrY18Ea2vqmpE6sW/VzOlZ1FFZHnRwOIgxUx2vrN
	KoKxBOdw+9MV5qJTBcGbscUp1aI6pU3+ngiWIPzJv90zXYLN/V5kKaTpwv3xFj/SajkGWP
	YMbEnn9EVaz8gvZtdi1b7UN7bKxP60Q=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-v5byfET5NcWIEbUFMFIENw-1; Wed, 27 Mar 2024 16:23:06 -0400
X-MC-Unique: v5byfET5NcWIEbUFMFIENw-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2d6c8f170e2so1150291fa.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 13:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711570985; x=1712175785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSamWa+KJaP8I2QU1s273bisfEt0jWshOBi7xx7K3D0=;
        b=Wcjm8VpdMPekxoc4BFhfpis4HBuEpXAi/wInyfkoiqJWOQh5U8vGHdt9TyLWzfcn7e
         jCFbZgvk/1MC8A3e7zNJz2n5GV5Pi6otUJvWlj+1GWvl2xuljkbeK9vrFu/5LSie1gAJ
         f9p1ZI8ypbGQB7zsqS9jcAdBwO+BEVTX0OOQa1ZKQRxKNXrKap9dTQGIOyqws6Mnfzek
         4XX0+IR6Y8MjzVcgBYYrcjvZzzTRdcG+sJaaesWj7Ng9cRkRJQjo5xaoSpy2G/NHY2Sz
         i1J0VmW4UBa7a4IsJBej/ssyV2+/aIxVzIRIRl4jgEJNGJcY/H0HwVgF6eSPvIBbGTRw
         pqbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoGl3c1mm1khYv8g0u4fUP1ll3/C+C7l3jd0wvYmTobkhx34CbOf5vmIHJkyuzgjyeWDq7VQhH/4MS+D6zq0VgCan6ePmaUGXM6mszYhq1H/0geA==
X-Gm-Message-State: AOJu0YyjC479AOqdjI+F+uIzpOsPd6Yi6UG3TN1BtPMy1YIjTejxlpVA
	6s+GpT64C0IFn2SPnaqI34VLz/MWOvFSmOZtL5SR9xfJbVfDK7DXmMKZhh6pdiCeAYv5ru+DtOI
	KhNiZBmUNgMaWQN1IIcH1Vd6MAF97SNK+mwWHmXGkNECpXN6K6caF8SoWog7IpGVdniASH8E=
X-Received: by 2002:a2e:9d86:0:b0:2d4:7373:2a5b with SMTP id c6-20020a2e9d86000000b002d473732a5bmr1016984ljj.47.1711570984284;
        Wed, 27 Mar 2024 13:23:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+/uSBddinToR19Kfpe0lSiXp/wCHGG764P+8y9fTcKtyY3XFLg5eLdVUVh1XfSlMcKNPsDA==
X-Received: by 2002:a2e:9d86:0:b0:2d4:7373:2a5b with SMTP id c6-20020a2e9d86000000b002d473732a5bmr1016967ljj.47.1711570983910;
        Wed, 27 Mar 2024 13:23:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ju2-20020a170906e90200b00a4a33db326csm3963869ejb.194.2024.03.27.13.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 13:23:03 -0700 (PDT)
Message-ID: <a281d426-1dd4-42c2-b688-f11fabaa9a32@redhat.com>
Date: Wed, 27 Mar 2024 21:23:02 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86/amd/hsmp: switch to use
 device_add_groups()
Content-Language: en-US, nl
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 naveenkrishna.chatradhi@amd.com
Cc: linux-kernel@vger.kernel.org, Carlos Bilbao <carlos.bilbao@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <2024032732-thigh-smite-f5dd@gregkh>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2024032732-thigh-smite-f5dd@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 3/27/24 9:08 AM, Greg Kroah-Hartman wrote:
> devm_device_add_groups() is being removed from the kernel, so move the
> hsmp driver to use device_add_groups() instead.  The logic is identical,
> when the device is removed the driver core will properly clean up and
> remove the groups, and the memory used by the attribute groups will be
> freed because it was created with dev_* calls, so this is functionally
> identical overall.
> 
> Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> Cc: Carlos Bilbao <carlos.bilbao@amd.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
> Cc: platform-driver-x86@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

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




> ---
> v3: change the changelog text to reflect that this change is identical
>     to the current code.  Rebase against 6.9-rc1
> v2: rebased against platform/for-next
> 
>  drivers/platform/x86/amd/hsmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 1927be901108..d84ea66eecc6 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -693,7 +693,7 @@ static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
>  		hsmp_create_attr_list(attr_grp, dev, i);
>  	}
>  
> -	return devm_device_add_groups(dev, hsmp_attr_grps);
> +	return device_add_groups(dev, hsmp_attr_grps);
>  }
>  
>  static int hsmp_create_acpi_sysfs_if(struct device *dev)

