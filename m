Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864ED334374
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Mar 2026 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715613; cv=none; b=u+KqLuGxwLaM91FLyFLJZEHUln3YMnwCYpuAlTqIQ2fGnp6MW9xK/qtaSNZLuivdiN8BYkLmcCOSuC4lEC0cRtTUArnpe93wOxlnFnZTZnjcLG/qcbKa/hf1TyB38F9/GsKHLa+Plh5nQNFkoCFpA+PLPJU/odzZzdlRNQmaTks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715613; c=relaxed/simple;
	bh=OgyahkIBxabBd1NN83GR4joqC3Z999qPJhZ+6MLtfXY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=XY2UdtRNKUiSxR/1mrctHIOk8ioLTrbEdYLvsirk5SG6yN8dHX55COlFLaR/2l+mN1aVWt55DpHxVFttvSL1C5r7oDKiRebV1nsJTfATa46RVNXnXo4Bc3fruZgGDiM9pGgzDK733cyOWBEg1skNWfL9BvRCcDR3Y6FfWT5heNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZZDu4mr8; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZZDu4mr8"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772715607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/MGwCUoCvj2JoupsDwEW1aIFjqc0tfxi/czjnwMNAU=;
	b=ZZDu4mr8MbHu09TWP/DgeAbsZnh9PITrV1Aw6wd/fv0pP35ua4XD83KEPTDd9F0JRcpVYr
	SMKdwcMvU0BlifJR0tgyyK5MG7vPpCWxdkrIUB9lA5ETpin34D39Rp3YhwSIZNuyJOChS6
	OVE7MB4l29psXv5F0B0KEhsgmvmHmZU=
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: Use sysfs_emit{_at} in
 show functions
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <77f08627-cb28-8c0e-112b-f7ebef5a9a74@linux.intel.com>
Date: Thu, 5 Mar 2026 14:00:02 +0100
Cc: Prasanth Ksr <prasanth.ksr@dell.com>,
 Hans de Goede <hansg@kernel.org>,
 Dell.Client.Kernel@dell.com,
 platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <27DCD6B0-3DDC-4FDB-BE29-873465FAD236@linux.dev>
References: <20260305124126.255026-2-thorsten.blum@linux.dev>
 <77f08627-cb28-8c0e-112b-f7ebef5a9a74@linux.intel.com>
To: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
X-Migadu-Flow: FLOW_OUT

On 5. Mar 2026, at 13:48, Ilpo J=C3=A4rvinen wrote:
> On Thu, 5 Mar 2026, Thorsten Blum wrote:
>> Replace sprintf() with sysfs_emit() and sysfs_emit_at() in sysfs show
>> functions. sysfs_emit() and sysfs_emit_at() are preferred for =
formatting
>> sysfs output because they provide safer bounds checking.
>>=20
>> In reset_bios_show(), use sysfs_emit_at() to avoid manual buffer size
>> accounting.
>>=20
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>> ---
>> .../platform/x86/dell/dell-wmi-sysman/sysman.c | 18 =
++++++++----------
>> 1 file changed, 8 insertions(+), 10 deletions(-)
>> [...]
>> +	for (i =3D 0; i < MAX_TYPES; i++)
>> +		len +=3D sysfs_emit_at(buf, len, i =3D=3D reset_option ? =
"[%s] " : "%s ",
>=20
> Are all checkers okay with this construct? IIRC something doesn't=20
> like having such logic in where only a formatting string is expected.

You mean checkpatch? No warnings, but I can split it again if needed.

Thanks,
Thorsten

