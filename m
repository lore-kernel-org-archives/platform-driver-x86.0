Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37604E1C1
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714390510; cv=none; b=ah5tzM4tqPWU4/Y75d9EVTdTwIv1KUebAjgtuE5atf0UzLeCxjuEYhLRaKx8WnMqa65d8jLxinjVPMRXM9kqIh2BXqH6kkwQICTsTQj3hX+hy8MvbszEvYhCaccte5+xfW0v4NyUdm2Evtk/fPsGq3fAC0XzneBmfKs954aXBYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714390510; c=relaxed/simple;
	bh=vWbJZVKuevzqkRDh2MXaKpilD4eyfGU02ScMboMQbJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QZi5MEJPD/EIakFtwda6TajgudJRX9SXLvOn3za8PFG5UiNjux0ZkzVPJiT4QLdJ3XnWoaFJFOB5GO+7NyrllqTU0LDZi61wWCXazU5egmZ5B3rdpIZOyFEJmc2S7nTb9ysvYcM9CKIoF0IX5C3iV6+DZMJ626oJpvwVgb40yzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DTR6sYmn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DTR6sYmn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714390507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=adxQWQhd0XrFa5oXvgwXbmjrSI2T0lJVLqdvh5MvXZo=;
	b=DTR6sYmnR8m5jyM/BpeoLpzvvOpBT6h+Ptyc8uLYzdsCiQoJGnwkAqyza6mWcNpJiJvsQN
	QOk8uwzbUIDBfEAjTAYwqwXstSKl5YIx1Vsv287VeC+3cAamu+OefWrCbq6U0muEXXx84I
	RDb6DhMXBtPRcf3EqSi9Oat0CQ8j0Ig=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-_YiUZ65gN7-gI_OjecTuyA-1; Mon, 29 Apr 2024 07:35:06 -0400
X-MC-Unique: _YiUZ65gN7-gI_OjecTuyA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5725fffb621so539710a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 04:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714390505; x=1714995305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adxQWQhd0XrFa5oXvgwXbmjrSI2T0lJVLqdvh5MvXZo=;
        b=vZjtmzFh9Mp9vWo26nazHhlKEhTbnooPESxAgB3T55JsiperN9uK+Zepn91sZEsWuP
         6D5EE3r9q7M4X0WJmM3cfCiWM3gwZ+h9pOOXYSG6knn0/BzAW6fWSnJRYWUophFefnA3
         o3SXYUR4an0fsWoEd7dJPUE9rpHduqDQ/O44XMspxl802PNG2yxY04709wuCaQguzJ9H
         hSHpw0xtqMgIX1fPCAGvDksLzEQFGK4J6evlkpDGe2fxGmgWb+nIqD+dEVZ+WGBpU0AN
         RjaZTMBk4pj82QM3PSBTYBafcWVx84Ie/PqarJ9U1RzQ8mvLiq+276PoZqKfVDEQr/K7
         +1Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVva+R4csIy7IfAHX4KSq+vNhVc+ZpdnWNWwyhIUI0MsQL1B9nUOfbC6BvVX1DUwxxkE0S42MGm4+B/ykNpMo7P7oRfmpewqYhPEjVzefyH8nrLjA==
X-Gm-Message-State: AOJu0Yyl1jETq8XS009WC8CFm6p9ZdcpYrcRweRsDMOj7VPKWcJs/BqS
	I91Bpgc64bslu7w+7MDKL7ePI6bbEDSvUx/eCge9NFONXg0D7EL7NsLyV++72AKZHo8ihnnWwq5
	Q+9Lcyt7hMEkh7bziW8BjbJsK0JzNsmwYBxm6ooEDZAX5Q4HBGIJS7d240pjXwSkK1MFDpsAROq
	WZUi4=
X-Received: by 2002:a50:c056:0:b0:572:7e7e:4296 with SMTP id u22-20020a50c056000000b005727e7e4296mr2292367edd.3.1714390504923;
        Mon, 29 Apr 2024 04:35:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBHHqSoYBKSugtDyzCtP1PK/DuZ2Y8c17tJdc/C16ed+YD1q6T1VMD8zgg7bDcZkBC30+qEQ==
X-Received: by 2002:a50:c056:0:b0:572:7e7e:4296 with SMTP id u22-20020a50c056000000b005727e7e4296mr2292356edd.3.1714390504562;
        Mon, 29 Apr 2024 04:35:04 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id u7-20020a50eac7000000b005727eadcb79sm1283025edp.46.2024.04.29.04.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 04:35:03 -0700 (PDT)
Message-ID: <5eaf12a7-c49e-4606-85f4-f6e5a2d78a79@redhat.com>
Date: Mon, 29 Apr 2024 13:35:02 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.10-rc1
To: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
 "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
 "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <6993d8890e0831efee03924ff09a9fc80afebd75.camel@intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6993d8890e0831efee03924ff09a9fc80afebd75.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/27/24 12:41 AM, Pandruvada, Srinivas wrote:
> Hi Hans/Ilpo,
> 
> Pull request for Intel Speed Select version v1.19:
> Summary of changes:
> - Support of SST BF/TF support per level
> - Increase number of CPUs displayed
> - Present all TRL levels for turbo-freq
> - Fix display for unsupported levels
> - Support multiple dies
> - Increase die count
> - Change CPU display for non compute domain
> 
> 
> The base branch for these changes
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> branch: review-hans
> 
> The following changes since commit
> 0084b1ef25438293c74efe6f8c5c1c8bdb1a34c7:
> 
>   platform/x86: asus-laptop: Use sysfs_emit() and sysfs_emit_at() to
> replace sprintf() (2024-04-22 15:44:26 +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> af243b7508f1ce8d49f1ba944c643c8850573e13:
> 
>   tools/power/x86/intel-speed-select: v1.19 release (2024-04-26
> 15:08:19 -0700)

Thanks. I had to rebase my review-hans branch due to other reasons,
so this did not merge properly.

Instead I have cherry-picked the 8 patches. You can find the patches
in my review-hans branch now:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans






> 
> ----------------------------------------------------------------
> Srinivas Pandruvada (8):
>       tools/power/x86/intel-speed-select: Increase die count
>       tools/power/x86/intel-speed-select: Support multiple dies
>       tools/power/x86/intel-speed-select: Fix display for unsupported
> levels
>       tools/power/x86/intel-speed-select: Present all TRL levels for
> turbo-freq
>       tools/power/x86/intel-speed-select: Increase number of CPUs
> displayed
>       tools/power/x86/intel-speed-select: SST BF/TF support per level
>       tools/power/x86/intel-speed-select: Display CPU as None for -1
>       tools/power/x86/intel-speed-select: v1.19 release
> 
>  tools/power/x86/intel-speed-select/isst-config.c    | 25
> +++++++++++++++++++++++--
>  tools/power/x86/intel-speed-select/isst-core-mbox.c |  3 ++-
>  tools/power/x86/intel-speed-select/isst-core-tpmi.c | 10 ++++++++--
>  tools/power/x86/intel-speed-select/isst-core.c      |  1 +
>  tools/power/x86/intel-speed-select/isst-display.c   | 30
> +++++++++++++++++++++---------
>  tools/power/x86/intel-speed-select/isst.h           |  2 +-
>  6 files changed, 56 insertions(+), 15 deletions(-)
> 
> Thanks,
> Srinivas

