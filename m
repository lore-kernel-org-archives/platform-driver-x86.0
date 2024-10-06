Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CFC171E55
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Oct 2024 10:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728211340; cv=none; b=pR95qwOZlc3hWvjyqUrDPKFo6Gbu80KcLqu2Zu6JbIwIF7X7i9K2HbSuAFJ3fxyBDh0NslaqTbNMHSJ9ev7xbAJ/jk4bR/f9YmRxpxnd7LdbBGheANho1ss8Yl0G5AWcWCTF2hJnuKe3tsRUF+xPZCptFR+nDLcmODZZFlOKLdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728211340; c=relaxed/simple;
	bh=6+HRFrlF1JJWGvZhJT8wdokuF0DptbaKivkL+kbGYyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ybmy9g7IfffcjNUV1PpIm7gybjWYTt01fKnXRRXEu276G4sHXHN1qfsaS8erS7FW4n5Sx9LtgetGOX2GROXtlNjiwKol1x3tLpKKzlKBvqjFnP1Tmy1zUZ7xjdiMDk2+a/offaG1bmyGr92rLj0jfJjzHTKa3J0a7qvqA4m4GvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aKAxnwpr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aKAxnwpr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728211337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KGEmNTQRg1iJUZchi2KFmwCCrxi+C5MgkzAzy/SBH9U=;
	b=aKAxnwprQ/3LS/AmHEguRhqmFIztHBrR/m9DbUKCCqhStLV4WUJAVl9uk/Wj/CPYEVtJMf
	SBwxdMcM3XhH3ZRIM7HCQA2GgIrks8sVI3rqZgg+b/NN37MMDdF8qMizwZ44uI8Hiri9kv
	8Spx94uhHydPfCufwxS8J4KntbVP9Ng=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-cCPInZZmPCOfVFn8011Vng-1; Sun, 06 Oct 2024 06:42:16 -0400
X-MC-Unique: cCPInZZmPCOfVFn8011Vng-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a8d0d87f204so557958666b.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 Oct 2024 03:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728211335; x=1728816135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KGEmNTQRg1iJUZchi2KFmwCCrxi+C5MgkzAzy/SBH9U=;
        b=NlI2qyVBQVK466vV00YLpZ3fY2HxZSm4iWIh6gQe0uOuhFh3oJCubvgwQLC5zOAj6L
         7mkPZSwWRb4sao8cbbLum84P14cQ6JCBQDW0SoaEyp8XaAPoAfAk21zD4I1/2mCyQOQm
         L2g/p/+ky4zTjJELHmFf2Gd7w+BDhT1hEOLHcsplw8Cax8XdPgweulMMg+Q5YMwUlpEs
         d9FUDafdCweMAZ6Qvqp63ydDYo3AZ3oXlstV+84ICjUexE91UnRY78qC3So3eocbmlC7
         VVw/itbnXkMNxfE+Vrpx45/02bS3LsNP76yrKf7b0DmVDZJUcxhj3MMNVQCm+Ci1UbiY
         M+lA==
X-Gm-Message-State: AOJu0YwcvrYsl7hSXQPdOPDMeB/qoklJ8ZcvFXfvbHytxv92rFlaNJwh
	Aw+/Ob1uT15uD9uGhYsGd4YOS3uaN9oPUd2ZPBn3HAfl2WOvIKZSB7hHEWvyVKEtur/ZHjUGSAq
	4XA6f+soBVy3dIZET6eXs9rABwz0ziZSqDqF9Ql3hwpTKGDJ7yP5sMcnVxNv6Qanak+hSCXo=
X-Received: by 2002:a17:907:e6cd:b0:a99:3db2:eb00 with SMTP id a640c23a62f3a-a993db2ed4emr392264166b.28.1728211335439;
        Sun, 06 Oct 2024 03:42:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1VY+W6PbEw2v4TLZdEMEZPsIMqt+ujS5sKuUxZxjwgb7vb8W2PMsB+Lyfcm2VvU6Se05kdA==
X-Received: by 2002:a17:907:e6cd:b0:a99:3db2:eb00 with SMTP id a640c23a62f3a-a993db2ed4emr392260866b.28.1728211334391;
        Sun, 06 Oct 2024 03:42:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9943cb94dcsm133466166b.186.2024.10.06.03.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 03:42:14 -0700 (PDT)
Message-ID: <7bd5d999-c83f-4a37-82af-23f688c97f4b@redhat.com>
Date: Sun, 6 Oct 2024 12:42:13 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Diamond Rapids support
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241003215554.3013807-1-srinivas.pandruvada@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241003215554.3013807-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3-Oct-24 11:55 PM, Srinivas Pandruvada wrote:
> Add CPU model of Diamond Rapids for SST and TPMI power domain
> mapping.
> 
> Srinivas Pandruvada (2):
>   platform/x86: ISST: Add Diamond Rapids to support list
>   platform/x86/intel: power-domains: Add Diamond Rapids support

Thank you for your patch/series, I've applied this patch
(series) to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in the pdx86 review-hans branch once I've
pushed my local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



