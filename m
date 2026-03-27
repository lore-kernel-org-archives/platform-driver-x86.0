Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B527725A2DD;
	Fri, 27 Mar 2026 21:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774645615; cv=none; b=EgLiYTHS4FjL29/uCNgrN5/nAqkeZM5NeVlNQqGNWQkjpZGty0zy8x/IqTL+7EqIFX/nET6zKgvvcRlzgvQ6iZfgDZ26PRlKhBrXN+JPej2JTKpClvdL7UgHDj8FYel8ai71rCsK7BpYSULRDlmHZgbFpJJoLg1LBS3rBcCRP0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774645615; c=relaxed/simple;
	bh=IMxsW3cYJYxbh0qR1hK59K81e48fz5YyIAZP4Q0PoTM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VRDJYfomByMemgLZo6bKzVgE1a8TYL0/cRCt4ISwXU0h31+9vgEjywmIcoQpFViK3+/sppBz/tXgSzT2Y74mJmyWJm2tFhvhjuJQrarEAtPYerPHZv+5+eLrYYa0sKLnu3CaHO7jBkCdFTRsPmxAOyJEmG9VtKjyfoFXiPWddHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=aIP88FOB; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="aIP88FOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774645606; x=1774904806;
	bh=IMxsW3cYJYxbh0qR1hK59K81e48fz5YyIAZP4Q0PoTM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aIP88FOBrWNRl3klG1lxgckSvDtahD96Gy0YpiIvYn0uFXBTWlb+joSbQ8IjFU7O0
	 SQRlq6ivaKl8XUUQrPVjZEgjFXLC9gdK8Tw88H3XQzBu5oIBZn1hXEIYi6pldBRDBS
	 DSk543Bwp6H8TUtTHs1sVQn0jP8LWmuAhWfO/dZ1qGJwLQTPaHLQ2bCGZfMU/hjkWQ
	 LfY81Kzi5Jjb5FhPbO6kBSuZ/9UlXfKWx2gBynNeCNnJnodK8SrhTFQcrn6nXbTpvd
	 z9FHAJxKnluB8wdu6jYsq+/bNn1oppY6Wr3fBPB/10+wh0HBvICjfbAwyp8pnM0wWa
	 KMPlFit6T9XTg==
Date: Fri, 27 Mar 2026 21:06:43 +0000
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: hansg@kernel.org, srinivas.pandruvada@linux.intel.com, ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Subject: Re: [PATCH v1 1/2] platform/x86/intel-uncore-freq: Rename instance_id
Message-ID: <acbwvaoncMKURFJw@wieczorr-mobl1.localdomain>
In-Reply-To: <91fdbcb6a8391cf945e53bccc3ae6f6f11412867.camel@linux.intel.com>
References: <cover.1774625521.git.m.wieczorretman@pm.me> <3c02a8e3c1d4f07fa7f37740c33050c4e1d3f6ee.1774625521.git.m.wieczorretman@pm.me> <91fdbcb6a8391cf945e53bccc3ae6f6f11412867.camel@linux.intel.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: e0f01836c59cd753834f0e1a333bc00e9ad96bea
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2026-03-27 at 19:56:58 +0200, Artem Bityutskiy wrote:
>On Fri, 2026-03-27 at 15:36 +0000, Maciej Wieczor-Retman wrote:
>> =C2=A0 * @die_id:=09=09Die id for this instance
>> =C2=A0 * @domain_id:=09=09Power domain id for this instance
>> =C2=A0 * @cluster_id:=09=09cluster id in a domain
>> - * @instance_id:=09Unique instance id to append to directory name
>> + * @seqname_id:=09=09Unique id to append to directory name
>> =C2=A0 * @name:=09=09Sysfs entry name for this instance
>> =C2=A0 * @agent_type_mask:=09Bit mask of all hardware agents for this do=
main
>> =C2=A0 * @uncore_attr_group:=09Attribute group storage
>> @@ -71,7 +71,7 @@ struct uncore_data {
>> =C2=A0=09int die_id;
>> =C2=A0=09int domain_id;
>> =C2=A0=09int cluster_id;
>> -=09int instance_id;
>> +=09int seqname_id;
>> =C2=A0=09char name[32];
>> =C2=A0=09u16=C2=A0 agent_type_mask;
>
>Nitpick: "seqname_id" reads like "sequence name ID" rather than a
>sequence number. Consider "seqnum" or "sequence_id" for better clarity.
>Just a suggestion based on how the name comes across, but not big deal.
>
>Artem.

sequence_id sounds good, I'll go for that. What I was going for was "seq" a=
s in
sequential and "name" as in directory name, but looking at it again it does
seem a bit confusing.

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman

