Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7ED4AE113;
	Thu,  3 Sep 2026 13:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443048; cv=none; b=aFQiyhUU6TY2UpmjUVlxI6QTU80j0g/hPlWE59Kpu2gDCbSWI50gVVDgXn5aJDJl9AzWNHoYDOzNP2SB8AzwA62+B8UI1Z9t7UVRawqfe+BXoT/rJCNMNPHXMZxDn6S1u1VXrKue2rKQtEebJDWgzo9wNW85mwIIf1Ksopb4mac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443048; c=relaxed/simple;
	bh=idxeMDGzGceZjzLhoHkF52o2RgH/4gHXnpaR2FBFDEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLzprVOqHhffT9A42OC4m0m1anzhtGvlf4VPf6C++NefMinHW26sUcPFKvXDFNOzaAYrjby8AEl9Oo2DAwB0LDdWmmPEmBlRHkixbn+AFojIVHyjQUBJQBLOIVFEFQOfyqhF2bc8EwV03elSHXuSEH8vTvRWaGjaUlRRUWcK0UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+6iZpfY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+6iZpfY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B411F00A3D;
	Thu,  3 Sep 2026 13:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788443027;
	bh=idxeMDGzGceZjzLhoHkF52o2RgH/4gHXnpaR2FBFDEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A+6iZpfYXTXphh8HVhrqHXkYmIISdY7ClMGWNt2qDh3cF2ro3wF+C35af+Ava72u+
	 m1hKbq3DcZyh92Sfk+ZwJnp8Hx8M76Gnk2X8EIQxbkNpDh/AxccWoBKe5aIMlHcq1t
	 MekyevL5mdgVVr3v6F7sw5ddOB+/wCAne59Cwe9mV5gIhnWgU4E1XR0ZPpyrUcvibk
	 Nba1SsOeFF8HAUVPQlye/27ACNU325l/h8YSrGTnFH23js8fkJHp9Cn4z8qX2hgMBM
	 KComwU/IspEltMAfLAzp9RGsAonhLiRRdFBx+EGqn5eRG1HTbu04WrYF+OSMWiS5TR
	 G5Qvvz1ZQIiRg==
Date: Thu, 3 Sep 2026 15:43:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Marshall <pm@petermarshall.ca>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 6/7] media: i2c: st-vd55g: Remove legacy vd55g1 remnants
Message-ID: <20260903-healthy-tungsten-gecko-ca7bee@quoll>
References: <20260902204549.657228-1-pm@petermarshall.ca>
 <20260902204549.657228-7-pm@petermarshall.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902204549.657228-7-pm@petermarshall.ca>

On Wed, Sep 02, 2026 at 04:45:45PM -0400, Peter Marshall wrote:
> vd55g1 is superseded by the generic vd55g driver supporting the same
> hardware and feature set. Remove it.

Why exactly this cannot be squashed to previous patch... or rather why
this driver cannot grow to support your new hardware, instead of adding
a duplicate one and then removing old driver?

Best regards,
Krzysztof

