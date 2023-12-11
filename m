Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NRnwVo3v"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05E2192
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Dec 2023 02:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702289290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8DYAEO6RTuUgtGwPcSA7dzuL0mDsMuuXUhbDs6Puc/4=;
	b=NRnwVo3v4sMZ6/XmTyloC7Uzs2meJXrSzYlJIkxjc26VgMhgbAMNXiU9/x2E0QMqTxOtiY
	LFsScPqVjf991JtlzYXaw61FpUm6TIYWgEjsrxqoH22G+N1ZGKGWR4L73SdFnlVsV5kXWA
	FgzjjFN7FS19VV57iK5/NA4L95ZpCJ4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-GMMbOaaOMN6e5U12LNoWwA-1; Mon, 11 Dec 2023 05:08:09 -0500
X-MC-Unique: GMMbOaaOMN6e5U12LNoWwA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-54c9604921dso2106020a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Dec 2023 02:08:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702289288; x=1702894088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8DYAEO6RTuUgtGwPcSA7dzuL0mDsMuuXUhbDs6Puc/4=;
        b=AGFC9INS7zTZ16pE1YrQrODfbH6UKUgUp1zhnNHCqnCKVrCNUMLYzQ2/KUMria3rpz
         F45tONKbjNZkRNFgSLkuGlcIB15jfsp40V5r2cklcgWZIdbhncoYmBvmeZWvlJGf9pr8
         9TaBgooAoojharY1e4gG6XwRbMKOpvhEw5XH/QFWndTCWSysxl1Vve6LZwfd5uMzggU/
         EEzUCI8B0kO9jjw7PHwK3V2tu2jvo9hda4CgfdHQkNrTOXRFadpMInhK9XMMnpJTXX4e
         RWAkNN5wUZm01IIpJ32rTKZji8lqXP6Pe7FLm6hn9MRkS8ZepKxYoW9Ev5IDkLlZQWDo
         ta4Q==
X-Gm-Message-State: AOJu0Yzd7mhPZaLalIcQe8KMc5QbCrdC6upqTBHKit71De6M8fxOgS7S
	8kxj3iLbYNsQS7cOtiSIKKxNv5rHsmimKxDlyFlNyTmki7eNNcKcMJfLDwSQA3hQng+UEbgb5vj
	7bcWXvRHfR1ROPGwMy0XBugmRG4YNUClgxtspW3sOow==
X-Received: by 2002:a05:6402:1399:b0:54d:a654:3109 with SMTP id b25-20020a056402139900b0054da6543109mr2329874edv.67.1702289287845;
        Mon, 11 Dec 2023 02:08:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOCxT8W97sjg8fbX6Cf42Fs3FFCdIiOP/iPB43TGX504dLSj4CGKf10WUJGwDvy51t2mktbA==
X-Received: by 2002:a05:6402:1399:b0:54d:a654:3109 with SMTP id b25-20020a056402139900b0054da6543109mr2329866edv.67.1702289287577;
        Mon, 11 Dec 2023 02:08:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bd18-20020a056402207200b00542db304680sm3469878edb.63.2023.12.11.02.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 02:08:07 -0800 (PST)
Message-ID: <c8d05509-2c53-4db4-a330-b2084e59c10b@redhat.com>
Date: Mon, 11 Dec 2023 11:08:06 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] TPMI update for permissions
Content-Language: en-US, nl
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231204221740.3645130-1-srinivas.pandruvada@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231204221740.3645130-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/4/23 23:17, Srinivas Pandruvada wrote:
> Process read/write and enabled state for feature drivers. When a feature
> is disabled, don't create a device to load a feature driver. When a read
> is blocked then don't load feature drivers. When write is blocked continue
> to function in read only mode.

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans







> v3:
> 	No code change. Rebased on top of 
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86 review-hans
> 
> v2:
> 	Dropped patch platform/x86/intel/tpmi: Add additional TPMI header fields
> 	Addressed other review comments, details are in each patch
> 
> Srinivas Pandruvada (5):
>   platform/x86/intel/tpmi: Don't create devices for disabled features
>   platform/x86/intel/tpmi: Modify external interface to get read/write
>     state
>   platform/x86/intel/tpmi: Move TPMI ID definition
>   platform/x86: ISST: Process read/write blocked feature status
>   platform/x86/intel-uncore-freq: Process read/write blocked feature
>     status
> 
>  .../intel/speed_select_if/isst_tpmi_core.c    | 25 +++++++++++++
>  drivers/platform/x86/intel/tpmi.c             | 35 +++++++++----------
>  .../uncore-frequency/uncore-frequency-tpmi.c  | 15 ++++++++
>  include/linux/intel_tpmi.h                    | 18 ++++++++--
>  4 files changed, 72 insertions(+), 21 deletions(-)
> 

