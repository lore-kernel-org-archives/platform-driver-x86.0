Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815F52D622
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jan 2024 23:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ABO+wNbj"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-46777099deeso291377137.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Jan 2024 15:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704411123; x=1705015923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K06Q1APMN9I3ubfokxa70wJJ9uj3roLT3AfjkUnyddg=;
        b=ABO+wNbjWAFoBWxcoSZl+wbAHr0TYvz+DMWGTfp6DucI6n0H1CXap/FE/JNE0U8I9D
         kyVOO5/Tm+hUoSYzftQJMPB1GfSG9LCfm12DL4ARb3lpGXlVhwrehVuiRpVCvJxMZ2rX
         aUNeIWLB0/xAilV+mYdJr6cJnedtTu4irhmb3gEE733C5g4IpTAcHocXT0K03/MPsjaK
         UrigkW987wdgw0gG7l+je1fnHbK39X+7n7xN3G/6sHYEH4ngdOt05kpAAVTTfyd4cc8R
         Wxs3AYcMQILjfLbDrKyp9hd2Ss4hlt/lE9kffNfR8KL0+OjWXCs3OSftG4OD4CLjl8PD
         dWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704411123; x=1705015923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K06Q1APMN9I3ubfokxa70wJJ9uj3roLT3AfjkUnyddg=;
        b=rYxBkeAFetNTT3hAUGwMLRDBz7v0CTafeozEKFZ6mXYEqHGq9Z2N7KQt+HHKeK1Fpl
         0Tmik1SJSJu+GGhWNTW8ZYIUAEAeZx3pSM6ZrQ5deerPGxeLRhgWZUojDgNStXgcmJCq
         96jZpUwepiGLVuIt9E8C2VD1ElfCy8DPEf2pfCdBCMVKBKxPdHcHO91xsPeOiRpoWA07
         1jJyzQzs1mjZ18OAfWPBJZ1cyvKpDDml/dp78Uy1FkpO0xwmPcUKsgtEisFAHvE28MbN
         Sp5gw8SptyIH2KKl1uQhm+1wivoQA/DPMCXKVAbUa+W8P4BUQ6Svj5JbwXQFmSrRdivA
         PotQ==
X-Gm-Message-State: AOJu0YyQHp0KvpgVlVRJ1flb+ay6erkGnV6HVvyFL8Jg947lGlFJUK0b
	6xpjia1395KoPgdo+VX57cVzBUR0u1Xd3Ylj+Xgdqgb0od0s
X-Google-Smtp-Source: AGHT+IEH4GW8DJnq+xTXvD9gNSezHL+DpWB+egTPafpfsthj+1H1yApQ6vdOjwEe1IhySNOjtcl5oA0flihZ+ROGyBE=
X-Received: by 2002:a05:6102:f93:b0:467:abe1:a536 with SMTP id
 e19-20020a0561020f9300b00467abe1a536mr1404665vsv.10.1704411123199; Thu, 04
 Jan 2024 15:32:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240104-intel-uncore-freq-kcfi-fix-v1-1-bf1e8939af40@kernel.org>
In-Reply-To: <20240104-intel-uncore-freq-kcfi-fix-v1-1-bf1e8939af40@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 4 Jan 2024 15:31:25 -0800
Message-ID: <CABCJKudq4iMHXZ1m+hf_McGVGuwV0Nh8Xph1asMscCrcnG0KLw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: intel-uncore-freq: Fix types in sysfs callbacks
To: Nathan Chancellor <nathan@kernel.org>
Cc: srinivas.pandruvada@linux.intel.com, hdegoede@redhat.com, 
	ilpo.jarvinen@linux.intel.com, keescook@chromium.org, 
	platform-driver-x86@vger.kernel.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Thu, Jan 4, 2024 at 2:59=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> When booting a kernel with CONFIG_CFI_CLANG, there is a CFI failure when
> accessing any of the values under
> /sys/devices/system/cpu/intel_uncore_frequency/package_00_die_00:
>
>   $ cat /sys/devices/system/cpu/intel_uncore_frequency/package_00_die_00/=
max_freq_khz
>   fish: Job 1, 'cat /sys/devices/system/cpu/int=E2=80=A6' terminated by s=
ignal SIGSEGV (Address boundary error)
>
>   $ sudo dmesg &| grep 'CFI failure'
>   [  170.953925] CFI failure at kobj_attr_show+0x19/0x30 (target: show_ma=
x_freq_khz+0x0/0xc0 [intel_uncore_frequency_common]; expected type: 0xd3407=
8c5
>
> The sysfs callback functions such as show_domain_id() are written as if
> they are going to be called by dev_attr_show() but as the above message
> shows, they are instead called by kobj_attr_show(). kCFI checks that the
> destination of an indirect jump has the exact same type as the prototype
> of the function pointer it is called through and fails when they do not.
>
> These callbacks are called through kobj_attr_show() because
> uncore_root_kobj was initialized with kobject_create_and_add(), which
> means uncore_root_kobj has a ->sysfs_ops of kobj_sysfs_ops from
> kobject_create(), which uses kobj_attr_show() as its ->show() value.
>
> The only reason there has not been a more noticeable problem until this
> point is that 'struct kobj_attribute' and 'struct device_attribute' have
> the same layout, so getting the callback from container_of() works the
> same with either value.
>
> Change all the callbacks and their uses to be compatible with
> kobj_attr_show() and kobj_attr_store(), which resolves the kCFI failure
> and allows the sysfs files to work properly.
>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1974
> Fixes: ae7b2ce57851 ("platform/x86/intel/uncore-freq: Use sysfs API to cr=
eate attributes")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I think I got the fixes tag right. I only started seeing this because of
> commit 27f2b08735c9 ("platform/x86: intel-uncore-freq: Add additional
> client processors"), which allows this driver to load on my i7-11700
> test system but I think the commit in the Fixes tag incorrectly changes
> the types of the callbacks.
> ---
>  .../uncore-frequency/uncore-frequency-common.c     | 82 +++++++++++-----=
------
>  .../uncore-frequency/uncore-frequency-common.h     | 32 ++++-----
>  2 files changed, 57 insertions(+), 57 deletions(-)

Looks good to me. Thanks for the patch!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
