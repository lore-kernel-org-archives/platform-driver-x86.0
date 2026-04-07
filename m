Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3EA2BE641
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Apr 2026 21:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775597542; cv=none; b=pFUpGnxKcvM12/4TVBYUNxuXbGFyKjze0gDcAfow4O6BtE9QDoLK7nQ/T5Ijiu8S99BTp8s5jpe3ZK/ASVdPM3IgtTs43qn+mr8rmxVMBnop0QeNO49P9bwtuNkWfge+2cYO995BWUM4MjoDyqKejlK6RbDmIW8Pc/chituPzCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775597542; c=relaxed/simple;
	bh=/eyjkKnlVERq7uRcS6E/PBj1srcLWljyAHueddzQ5hc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hbcuxKI4ShnLS/MIjeoJuOZ6J8enuykzDLrM4lTW4OSpJ64xMuj1xD11mpfV3/7yImLfJFLvoZ+WsVBKGAHQakP8KLepexRZFpKEcjT7p52YhLiz+lKME/KKW3xCj86GuNoPjDSrTJHCBhrVbxNmLQdNftxspgbwZSxe7TFGroI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=nyC5KCdY; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="nyC5KCdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775597538; x=1775856738;
	bh=/eyjkKnlVERq7uRcS6E/PBj1srcLWljyAHueddzQ5hc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nyC5KCdYgDn1Q/ib7UUOxxNe/y9tUSqz2+U9DsHzsyklrbK4tLgcc7/PeXsXYe1wg
	 025fikhIsH0was8ShS/PvJitWbGk1nBofcHTwFzfNuo4UWdZT2iBCv06gZczHnlk6M
	 l26hwZtc0juNvKwt7TYpFojKz+fQ9/w7g61i4dAWMiEApdPeEHM04FkfI6ITdRI7Fo
	 urQ/LcxxwYB1S7WZubg/0Nv7+D6plCaVvEU+dNUZUKdnEhF1DWKuVbVyDPEf9aOrEq
	 So7ps7z4PAutQc2S5f3AnbWTQTGcBx3DvttsOJ2LIHzk7eijQlmx+cTxUCPcyE0mr9
	 a1PAitEfDI5GQ==
Date: Tue, 07 Apr 2026 21:32:13 +0000
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, dedekind1@gmail.com, artem.bityutskiy@linux.intel.com, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Subject: Re: [PATCH v2 2/2] platform/x86/intel-uncore-freq: Expose instance ID in the sysfs
Message-ID: <adV3yqxts28Jsgts@wieczorr-mobl1.localdomain>
In-Reply-To: <4ff01d1a3de5b392a9b19b5c33d1dd4e2d62e635.camel@linux.intel.com>
References: <cover.1775159775.git.m.wieczorretman@pm.me> <191ea429fcf60aa6612b89dc9357c6d452c50be4.1775159775.git.m.wieczorretman@pm.me> <c40b5b4b63fbc9b757892aa5927f5c46655b94d5.camel@linux.intel.com> <adVJgJGUGLQ_W4Ny@wieczorr-mobl1.localdomain> <4ff01d1a3de5b392a9b19b5c33d1dd4e2d62e635.camel@linux.intel.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: a5cbdd32a290332b57c895cc55a887859b89e7d0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2026-04-07 at 13:37:32 -0700, srinivas pandruvada wrote:
>On Tue, 2026-04-07 at 18:19 +0000, Maciej Wieczor-Retman wrote:
>> On 2026-04-07 at 11:03:06 -0700, srinivas pandruvada wrote:
>> > On Thu, 2026-04-02 at 19:59 +0000, Maciej Wieczor-Retman wrote:
>> > > From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>> > >
>> > > Insufficient data is exported to allow direct access to TPMI
>> > > registers
>> > > through MMIO. On non-partitioned systems domain_id can be used
>> > > both
>> > > for
>> > > mapping CPUs to their compute die IDs and for mapping die indices
>> > > to
>> > > their MMIO memory blocks mapped
>> > > =C2=A0into userspace.
>> >
>> > not mapped. But presented to user space via TPMI debugfs.
>> > > =C2=A0However on partitioned
>> > > systems it can't be used for mapping MMIO blocks anymore.
>> > Again not mapping.
>>
>> Okay, I'll fix these two messages.
>>
>> ...
>> > > --- a/drivers/platform/x86/intel/uncore-frequency/uncore-
>> > > frequency-
>> > > tpmi.c
>> > > +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-
>> > > frequency-
>> > > tpmi.c
>> > > @@ -385,7 +385,19 @@ static u8 io_die_index_next;
>> > > =C2=A0/* Lock to protect io_die_start, io_die_index_next */
>> > > =C2=A0static DEFINE_MUTEX(domain_lock);
>> > > =C2=A0
>> > > -static void set_domain_id(int id,=C2=A0 int num_resources,
>> > > +static void set_instance_id(int id, struct
>> > > tpmi_uncore_cluster_info
>> > > *cluster_info)
>> > > +{
>> > > +=09/*
>> > > +=09 * On non-partitioned systems domain_id can be used for
>> > > mapping both
>> > > +=09 * CPUs to compute die IDs and physical die indexes to
>> > > MMIO
>> > > mapped
>> > > +=09 * memory. However on partitioned systems domain_id
>> > > loses
>> > > the second
>> > > +=09 * association. Therefore instance_id should be used for
>> > > that instead,
>> > > +=09 * while domain_id should still be used to match CPUs to
>> > > compute dies.
>> > > +=09 */
>> > > +=09cluster_info->uncore_data.instance_id =3D id;
>> > > +}
>> >
>> > Do you need a function for single line assignment? Why not just
>> > assign
>> > in the uncore_probe().
>>
>> I thought uncore_probe() would be less cluttered if I move this
>> assignment to a
>> separate function, especially with this longer comment.
>>
>> But I can move it to uncore_probe(). Do you think the comment is
>> helpful or
>> should it be shortened? I thought it'd be good to keep some context
>> information
>> in here too.
>
>I think static inline should be OK.
>
>https://www.kernel.org/doc/html/v5.8/process/coding-style.html#the-inline-=
disease
>
>"
>A reasonable rule of thumb is to not put inline at functions that have
>more than 3 lines of code in them. An exception to this rule are the
>cases where a parameter is known to be a compiletime constant, and as a
>result of this constantness you know the compiler will be able to
>optimize most of your function away at compile time. For a good example
>of this later case, see the kmalloc() inline function.
>
>"
>

Cool, thanks, I'll do that.

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman

