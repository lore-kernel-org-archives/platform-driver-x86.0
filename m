Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68A71BF2A
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 14:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713190168; cv=none; b=uD3vwAOJyjMKnLCSBEYeONxq+Qw+ZGh5BQJ20Sw0ADxONLaSttLJpWbzRZ7Of7b3HflA8uLbqb43m41k58ak9WV6esN+IpurRviQBt8It7fEOY6vyihTTa3ZMu5nWysdN3yCb3wNqTnzQ4wPoqPM3Y7M/P0VwUet7QSJtymllHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713190168; c=relaxed/simple;
	bh=K9QbWezbtWYvGJPwTu4MnuX3yivJudEWc0TQrrbVKZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cx2QjxrNzIfNi8WXph1oIM/MabVGWqA14q7b451XjqmY1GymBYJcNMwcygGK8axZEyqOqmD9W1wwtiXzJp40fZvrgRvcGDpj72XXbDRCzuovIJ9WX981O027heseqXUjB7XadUROOs2iW/kgHVN4tYWkI2Wr03sJLGpNqJ0HOOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HVkoKDkp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HVkoKDkp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713190165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=59OYK1dKNmJ+Wab1v4wRFM9PkaPOIoUi0FsclgE1vnw=;
	b=HVkoKDkpCnSFQy2QMtXqqGqyZ8TnObEqV77xRBZeQOPYPJ0m5nPlrvD9+cngULLY2YXdQU
	d/+4pGWIXYsi/DixlHwrh9O7JRjf7Yce8GbSIEUuPDRyDgirYjfyk8N63ZhxfkjvH7fo0D
	Tci85QA0fPv3Na6R1nE3ZW41Gc/Qxvw=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-YhbxpgFJNL26BIHh3pBn1g-1; Mon, 15 Apr 2024 10:09:23 -0400
X-MC-Unique: YhbxpgFJNL26BIHh3pBn1g-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-51895074307so1730617e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 07:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713190162; x=1713794962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=59OYK1dKNmJ+Wab1v4wRFM9PkaPOIoUi0FsclgE1vnw=;
        b=UJCJ9Nu0Z55YromkCagYy4sibgYTvjZ4TjRikySJug3qECO70gvQurg5vKrDY8hn60
         Jo3ShFBnjrDwgLEo6Zp8YScEA/Dacg0xdIM3c0wnb1bHBckm1WS6Pxwh2B11mMqDxveE
         Ur8Zlojkr2ycJK3vcS4pF14qziY9bcIqvLYmtIaYIg3XnhNKNNYqoqo7ha4ZdeuyleyH
         iLcSYXz/6o3YzarxgzTK9j0yyRv2HMJrGRVjIlDD+Xk7UA62rv3wRbN9hiCEllwIDnVT
         BXOdDdAWDNrs21QW7bfJgOQI0oRWXMK5XsL0mqAGwPoFjj3xyVPMcO8yHkKVFDl3W+Qw
         geZg==
X-Forwarded-Encrypted: i=1; AJvYcCXijens3ssPR1n5WGqsRH6IZYc0/wd1JuGbHB2dlRyhijuHjNRvTxa8l3tx38JTkvSn88UJV8r2ZN8QLCYM4lJOsB5X4v+2NrpgZYYwWCyZSskUWQ==
X-Gm-Message-State: AOJu0Yzr6PKErMyHW10KfBAkwlupRj1jA+vmRjHZIrunh4gvH9cGNIuE
	r3WqnnFSom9U3HSj+71XpvFF62AiR4aHrjTcm8Apfs98VpwIjhhvt6bDS5yMGNxjUlv7nF/eEHw
	aWND1RCTK9IMSQBRaIN76JPcSidrS2xvAjDFAaGQw8wrPNE8qflXUzygorcdnZ1uluk2ANVk=
X-Received: by 2002:a05:6512:15a9:b0:518:dc5b:6f5f with SMTP id bp41-20020a05651215a900b00518dc5b6f5fmr3519858lfb.15.1713190162555;
        Mon, 15 Apr 2024 07:09:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQBdaJCzssMbFDWYfjpDXeFVU3rFR4JfnHVug2GQ38jGI9pB/5b2x7pGjZ7zo9KD5SBaywUQ==
X-Received: by 2002:a05:6512:15a9:b0:518:dc5b:6f5f with SMTP id bp41-20020a05651215a900b00518dc5b6f5fmr3519837lfb.15.1713190162238;
        Mon, 15 Apr 2024 07:09:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lo17-20020a170906fa1100b00a466af74ef2sm5458053ejb.2.2024.04.15.07.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 07:09:21 -0700 (PDT)
Message-ID: <5bf08002-f1b5-46d7-be48-c81fde16906a@redhat.com>
Date: Mon, 15 Apr 2024 16:09:21 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 0/9] Intel On Demand changes
To: "David E. Box" <david.e.box@linux.intel.com>,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, sathyanarayanan.kuppuswamy@linux.intel.com
References: <20240411025856.2782476-1-david.e.box@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240411025856.2782476-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/11/24 4:58 AM, David E. Box wrote:
> Adds driver and tool support for a new "current" meter that allows reading
> the most current, but not attested, value of the meter counters. Also adds
> fixes for the intel_sdsi tool.
> 
> David E. Box (8):
>   platform/x86/intel/sdsi: Set message size during writes
>   platform/x86/intel/sdsi: Combine read and write mailbox flows
>   platform/x86/intel/sdsi: Add attribute to read the current meter state
>   tools/arch/x86/intel_sdsi: Fix maximum meter bundle length
>   tools/arch/x86/intel_sdsi: Fix meter_show display
>   tools/arch/x86/intel_sdsi: Fix meter_certificate decoding
>   platform/x86/intel/sdsi: Simplify ascii printing
>   tools: intel_sdsi: Add current meter support

Note the subject prefixes of these last 2 are wrong and should
both have been "tools/arch/x86/intel_sdsi" I have fixed this
up while merging this series:

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans





> 
> Kuppuswamy Sathyanarayanan (1):
>   platform/x86/intel/sdsi: Add in-band BIOS lock support
> 
>  drivers/platform/x86/intel/sdsi.c      | 118 ++++++++++++++++---------
>  tools/arch/x86/intel_sdsi/intel_sdsi.c | 108 +++++++++++++---------
>  2 files changed, 144 insertions(+), 82 deletions(-)
> 
> 
> base-commit: 4cece764965020c22cff7665b18a012006359095

