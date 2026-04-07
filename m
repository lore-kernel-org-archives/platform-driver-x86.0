Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1474F3C457A
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Apr 2026 18:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775585628; cv=none; b=mDyhDxnhidzeFAGILEFD5vJaxpBp6B5eTv6W6xS9srWHS3D9C9EUsnlLUVYPJuJiW2Z+gAGJslIGefEOtqNTRA255hOk6BTTaZTPICWbY3EFTrMmTuO+NhHIlR2ljFGYr8D50COTVCSmjWsUoPlInQq26eYEgERDPQkGoRxtfWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775585628; c=relaxed/simple;
	bh=WtL88miEUYjTTnqC+CJVV8pes41PtEjzZx6JS1Sd198=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cRN6r25uSMYfeV6YkN2+B8hM1AfoOeMuSbJGCMp/GVKDaPvphSQysSI1i9pVTppiertCd/tlgPSd7YMxIjv6rIelMuYRfvVSiASpRWBUYpixqu0ZUY2KqzaXkSINCcrZCY/y+aFVtHcRxpqzVpvM8KF0tngHGJPyNsQpzmBzOWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=USrXG7H2; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="USrXG7H2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775585625; x=1775844825;
	bh=WtL88miEUYjTTnqC+CJVV8pes41PtEjzZx6JS1Sd198=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=USrXG7H2/AE+xbG4ezrkYfsbHMvkGkdMM9juzOcZNa0GGC/f13LJhp6RWKmT0xmvm
	 j+sT/ivYmNoQdWyQzX4nAXKeonuyQ1NM/GOi8/eNSLHGuk8j866Z/Exp5G4n3ehcsE
	 jRe8OOKFsvX1Q/Rwj6iOkzqyMnmtOpkJBpCgEjqYZIc7L0K93KiTSZn4Ss3yuV/pnK
	 kHeuJNB9Db9wDTskGa9ltuB912Uu+E0Cbv1wPcx4Za4z8gk4xiFh7CO5Xoc+fJ2c1B
	 iaV/It7PwIDHtgoVQdRSFpg4Kuc9pgfaEeTDqw6QJ/Ek/NHC0Qdan7nc1DF+GW16AX
	 liMPFwoNHxoJQ==
Date: Tue, 07 Apr 2026 18:13:41 +0000
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, dedekind1@gmail.com, artem.bityutskiy@linux.intel.com
Subject: Re: [PATCH v2 0/2] platform/x86/intel-uncore-freq: Expose instance ID in the sysfs
Message-ID: <adVIzpNy8jvD1AX2@wieczorr-mobl1.localdomain>
In-Reply-To: <e96c61877730f624e8ab9793c17f485538dde545.camel@linux.intel.com>
References: <cover.1775159775.git.m.wieczorretman@pm.me> <e96c61877730f624e8ab9793c17f485538dde545.camel@linux.intel.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 7822b4ef8a406966ab9a77dea9fe4b219f457d22
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2026-04-07 at 10:45:58 -0700, srinivas pandruvada wrote:
>On Thu, 2026-04-02 at 19:59 +0000, Maciej Wieczor-Retman wrote:
>> --- Motivation
>>
>> This patchset is about exporting instance ID, a value used to
>> uniquely
>> identify MMIO blocks in TPMI devices. Userspace tools like "pepc" [1]
>> can use it for direct MMIO reads or writes. It's faster than the
>> alternative legacy approach which is interacting with MSRs.
>This statement is not required. MSR is not an option. This allows PEPC
>like tools to do some platform specific turning which is not supported
>via uncore sysfs.
>
>Thanks,
>Srinivas

Okay, I'll clarify that. Thanks!

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman

