Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9386854654;
	Thu, 21 May 2026 03:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779335845; cv=none; b=ep4AYw5PY5mvgSZghV6mepchYTKvEhd+7RQ+I9p43axpg1YNZvEjDcRJdaW/OVfNp0ECksV+pKuFhi41PA6m1HCzQbpAtM4PibWirl2wcPBDqIAQJzPomqdSPU1KyHRkJ7b8sKD1MlSEM9bTsI98HuOK+Gl0ApWAczEHCVPe/Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779335845; c=relaxed/simple;
	bh=sxDgCc+KXl9Y/sN+qG4eogJdAu3x8xaDps7O0akaSvs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W4Yw9YOiNtAjpIPiWaL3QFLfZITv91ETx9spjM+zG3BaAzcGKfzUOnMvp6AWaPGk9fMXPJqlWg4Mit2LsdVbDJ8k9xY4iYhiePMZJQhkKYnN9KEDTcgwlA5zW9hHZnVPE3iigL41WJgNTBn99sdXFb/Ywh4rNqD+lxb01I35k3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=HWQes0UE; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="HWQes0UE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1779335813;
	bh=uJG7Gz4s6SYQVKx8qCQgdMvx2A70Jex4khRVJV4lauk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=HWQes0UE4URP0nc6Hb8p8l7i+mKnFKS+shPBLTISvZBvoIQQ/wn4Z9XjurW9qdoVo
	 XgUW5n8FqExxJXuLaRpS7FKac1/dn8lvMbo6J5hDntJJKXBsGf2aQpt2id6MrDxtNw
	 WGWTD3bVqICAffOJkyzpHoU6SkHZcoUpk1N1CPPw=
X-QQ-mid: zesmtpsz8t1779335807t7d904017
X-QQ-Originating-IP: 7N9fDnWubkcJVt9Mp0RurGHxfhyXUsNeeW0Svj/gFDs=
Received: from localhost.localdomain ( [1.202.39.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 21 May 2026 11:56:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10425209266192534477
From: ZhaoJinming <zhaojinming@uniontech.com>
To: ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com
Cc: hansg@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86/intel/tpmi: Fix memory leak in mem_write() error path
Date: Thu, 21 May 2026 11:56:21 +0800
Message-Id: <20260521035623.1426374-1-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <9de7a91f-2dfa-7a99-9580-378c7a044bce@linux.intel.com>
References: <9de7a91f-2dfa-7a99-9580-378c7a044bce@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: N+n6UtIkOPCaRMoRnugjUxxrliJn9RvzfKVjFPnE2U2hRc5RhxiugLaN
	fjuw8coS8iaswPImiLompptD3DaIUGCSm8tWtIOWvmai/9E8QmuZkjJqbhdF8k3fVbZ0Umf
	sKth1iDlfM2hI7KeoWpr+TjKkd6W64OBPQswqEh/Le+1cw7XPDkTZGBiPDL5T7QuKIb6A9I
	/n4/dQTs3fDMXFPyf6ADLYsK/21hVm0Lb3fSasAEXDznarbiVOKUuChqwnipFixBsCobCb+
	NVNEd4FbGeNL4sq6DwEP8NPfLXJImj6RQ6S95IwsHwE0mr8ZeD7voTZM0RfEFCsh5FH8ros
	X4TqRqthnkATrWaAPYleAzy+9puqFkYCiCMW4gyQsfqm3QtNqdJqTBz3G/xd06eaHZBvRC4
	kv6FG+0NfOfQ8jkIiAdxRjUGgVuDGKMdB9qJI++7sE/5nfB66H7GCgwPxgQQp8FYtOkE85y
	k4YWQ9sKPC1dkz2M5kv8Yk5Ch0fSL6ZENBnxwzocgtsCrmuWy/htkAzm8q8DzTRPMSLtupF
	bFfFpuDtrgzXbEpmA0zf1TP8AbIbuDM0fzxwb3ZR3vU35A0/SztGyeaUUhdCv2DCBBdVYnU
	d9gkBTkqavN8WUX9mW0M9HtO+TdbFQV7yas5Vja9ckSWtzhG9pmfGkPcIROS1S7JEHNJM22
	A5gYQPxFhezS1DE/PZiUj/KeBYWcbbUi5rAT2EZs8j6KN4IAgu506Tpv7gniDnQXLAGXRBV
	kWiIcHQwRKhhap++Bj6QojfgAQmeYdoKLZn4pr1JpoluaVs0bF4LHxQFOqrZZngD9aHA5pP
	b7WhtBEdx9azlvCqPb2eWBjBIp8Zo8PpSgUzgQKIIQvT9TxTQXqBNTQTcvkkjVjsLzfVSyk
	/fmxq+NKtC7sYEeMqzvRLLsodTdvbm0ey2VSGqqv65uU8nUQtj8jDQJfX3SIi+33WrEB3J2
	Gy6BcsJ7uZHxh5PSj++6RrkoTNEANLw3EUpMxe0eYGIEZWY3Qk6F+jpwSbymGt2kFJg54LE
	I9So5Dl0qAOdRJF1PRmfU52J4ELVc9s1Q45f/YeQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Updated two patches, moved remove-goto-tag to the second patch.
Enabled CONFIG_INTEL_TPMI, build -> patch 001 -> build -> patch 002 -> build. 
Build kernel successfully.


