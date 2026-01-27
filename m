Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8238F5B;
	Tue, 27 Jan 2026 05:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769492036; cv=none; b=kLFy30mSpUfxB4hFVceAb5mlmB7pXfVbNiCLJPC1ubfgfiCNR3CSueSjs+BDexOXPoNnH3SKoQAhU/e2Y9I80lfprgC3WLxEXCV4O6SCpyKP8s0e/1QZAIvi+uTBuYTHA3ONXQClGuR7IpyOOewSyNYuZl0YFhxSpPNM/xQkSsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769492036; c=relaxed/simple;
	bh=HIqq1HfqXUpPGxiMh7yo+YyWH14D7EdmttcLxyIPCpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IcdHEH6qMoP0/frBuAP8T/nxaKCScrT5eIgmKHLeuRY11nGX3gCtpYmkJhsQ+T/jJ3K4cNTdY29mYnNk/ubiu3oZb4mghn3lhhyKROSx9mIOVdee6gjX1GQECdfAr11tyVv/iIZ5xAaRxVLpykRCazak4CE4RK9EI7btKDbCcz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=T8M652Ap; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="T8M652Ap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1769492028; x=1770096828; i=w_armin@gmx.de;
	bh=8Areq3JadwNxRchNnmdknNkUm4dN4l+4wIhWuQmni4M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=T8M652Apd5mlrYIqukfo1RHEd9eoF2REvfyBpFtQmA36uCAkC/SnqZGc7ul8j5qB
	 9qqgD07C49JDwYGzOY5+ge+xsjqApkT0SrxGuZx+uvX2SKTU84bqOXi/Re1haeApA
	 eSjRMIahL5say+VsZn2y5uKrEayVy9r/a/o9IEF5yXIX36RuJSB8rdIIDNpVVkSkz
	 HRWd7q1/0q7psQLZ01GSphIxt9vNvo5kQ7SnML+ZWLf3IhRh566HxqdzEbiwdCBHX
	 IS44fRoaesmLvMdPsyQy70TC4jUtC1U1xl9pFDif5spLfL3kztRC4Wzq1fqY9FtCt
	 o447J8MxH1AFxVYGVQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.24] ([93.202.247.91]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mt79P-1w0LLB2eHR-00sPwd; Tue, 27
 Jan 2026 06:33:48 +0100
Message-ID: <5dde5800-eead-47fb-a6e2-2c24d6b540d4@gmx.de>
Date: Tue, 27 Jan 2026 06:33:47 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/wmi: string-kunit: Add missing oversized string
 test case
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 hansg@kernel.org
Cc: nathan@kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260123211537.4448-1-W_Armin@gmx.de>
 <176943782325.10029.7973089336343143093.b4-ty@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <176943782325.10029.7973089336343143093.b4-ty@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:M+5DoTRELQySdgceBHd8xOWCBu/G7irp1L5C8EawAYYisF4622l
 0XRvmZrXDNSE5Fa3TnjBCSvVhEIKMSp1i7QQFN/oOU15aFWJ7Qs0KNBiKO71EBFANEbk4/B
 YmUsQAQ3czgpxRqcaoeLzj738aauuUrplh3n/Fp3pJNvRB61R4fMKICpn46UhdWIsQO2CPK
 j1r3dqzCttmm27E9RRwtQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7FLKe6DBWV8=;hzD4vmz8zdBibyGzWE2+bV8pisu
 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

Am 26.01.26 um 15:30 schrieb Ilpo J=C3=A4rvinen:

> On Fri, 23 Jan 2026 22:15:37 +0100, Armin Wolf wrote:
>
>> When compiling the WMI string kunit tests using llvm, the compiler
>> will issue a warning about "oversized_test_utf8_string" being unused.
>> This happens because the test case that was supposed to use said
>> variable was accidentally omitted when adding the kunit tests.
>>
>> Fix this by adding the aforementioned test case.
>>
>> [...]
>
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.

Thank you :)

> The list of commits applied:
> [1/1] platform/wmi: string-kunit: Add missing oversized string test case
>        commit: 5d4ae0bffb6eeada6dd16ba52150457ae96c3725
>
> --
>   i.
>
