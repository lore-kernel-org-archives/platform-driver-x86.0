Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E5340DFDA
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Apr 2026 18:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775585954; cv=none; b=b44GbDEICprseRDpYnO8rDK4lejbRI3FosOvox4CGptOCXRZKTX3XpAqHjcCrG89AI5g3I6Qxx34DHJX/GXTa2kTZ1QHZceg7F/KLAX+YG18n1fd7Yhi9XQJZ+bfJEF2VNacsXtzB7MkxV1xHjQ8lLDnJIYQ4H/VrIY+VSCPtYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775585954; c=relaxed/simple;
	bh=hioRno2QAamShTPHiMnAMsHdDAscUq4Ws1jDArJSVZI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lzyx8BdUzGcAvnhM20fevllbfbN9D5DJWSIqXj3nI+8kJxSNmzmnVwFhUd68gRt9w/LkOLXpCIvqxkZ55Uvo/9Ah8qMn8m4gclgz1Oedvzg6po2PgAgXujpf94XxAHTb11kvo/b8N9VOUOEf3g616cg3InL8oEao0i9DlXOAVX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Z+/61XkX; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Z+/61XkX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775585950; x=1775845150;
	bh=iIrbBvJCk2cDzZZ73/68ZbN5EIXt7BHarenAF6pqOLE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Z+/61XkX1pdwdjRu05kEjNhOJUrWGqtp0fp/qBdrjiWgyR1KYFNPVtfTgkwMNItZW
	 EWhUIJ7+u/CtNSs04Rv2IWcYFYCiwRx3fOPh+7X2FXHGbSg1dR+LjlQL3iYzNUjrwf
	 jXMpTiShN82jg9tbqgs3Dsb1jNKEnaEmtFAWpEN5piVmhvUxHVvgKdkIWIB8PUR3D8
	 xTgvgXSN2/gaiLsufVV99uj7WkWa0jSFejAqI+Zwc2QMykbEPQ9yqg9op9d1YeR17A
	 r88XU0i4FRH6BbugLOlFOJrr63TOD068ZYHioDrk0IUF+7UGDeDgvkEQB8G8Bsxk9p
	 anSIX5xJurjuQ==
Date: Tue, 07 Apr 2026 18:19:06 +0000
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, dedekind1@gmail.com, artem.bityutskiy@linux.intel.com, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Subject: Re: [PATCH v2 2/2] platform/x86/intel-uncore-freq: Expose instance ID in the sysfs
Message-ID: <adVJgJGUGLQ_W4Ny@wieczorr-mobl1.localdomain>
In-Reply-To: <c40b5b4b63fbc9b757892aa5927f5c46655b94d5.camel@linux.intel.com>
References: <cover.1775159775.git.m.wieczorretman@pm.me> <191ea429fcf60aa6612b89dc9357c6d452c50be4.1775159775.git.m.wieczorretman@pm.me> <c40b5b4b63fbc9b757892aa5927f5c46655b94d5.camel@linux.intel.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 69140e4ddb79bbcfc498fbfcf67818a27862697b
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2026-04-07 at 11:03:06 -0700, srinivas pandruvada wrote:
>On Thu, 2026-04-02 at 19:59 +0000, Maciej Wieczor-Retman wrote:
>> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>>
>> Insufficient data is exported to allow direct access to TPMI
>> registers
>> through MMIO. On non-partitioned systems domain_id can be used both
>> for
>> mapping CPUs to their compute die IDs and for mapping die indices to
>> their MMIO memory blocks mapped
>>  into userspace.
>
>not mapped. But presented to user space via TPMI debugfs.
>>  However on partitioned
>> systems it can't be used for mapping MMIO blocks anymore.
>Again not mapping.

Okay, I'll fix these two messages.

...
>> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
>> tpmi.c
>> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
>> tpmi.c
>> @@ -385,7 +385,19 @@ static u8 io_die_index_next;
>> =C2=A0/* Lock to protect io_die_start, io_die_index_next */
>> =C2=A0static DEFINE_MUTEX(domain_lock);
>> =C2=A0
>> -static void set_domain_id(int id,=C2=A0 int num_resources,
>> +static void set_instance_id(int id, struct tpmi_uncore_cluster_info
>> *cluster_info)
>> +{
>> +=09/*
>> +=09 * On non-partitioned systems domain_id can be used for
>> mapping both
>> +=09 * CPUs to compute die IDs and physical die indexes to MMIO
>> mapped
>> +=09 * memory. However on partitioned systems domain_id loses
>> the second
>> +=09 * association. Therefore instance_id should be used for
>> that instead,
>> +=09 * while domain_id should still be used to match CPUs to
>> compute dies.
>> +=09 */
>> +=09cluster_info->uncore_data.instance_id =3D id;
>> +}
>
>Do you need a function for single line assignment? Why not just assign
>in the uncore_probe().

I thought uncore_probe() would be less cluttered if I move this assignment =
to a
separate function, especially with this longer comment.

But I can move it to uncore_probe(). Do you think the comment is helpful or
should it be shortened? I thought it'd be good to keep some context informa=
tion
in here too.

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman

