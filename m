Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3726C4AF16B;
	Mon, 31 Aug 2026 17:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197352; cv=none; b=aPPEy3PXRu610zW7bH+cc1HHXixYZh8EOSKLZ6CkekLSFUldIazbsH3db4HJ1gOBMkG7Z2+gg9Vw/DzS+gnKrAOWBrA0ISJEPBz4u7Ahx/Ep2VGxrjfZhVaJuguyQyTT4e98Z5CbqIziVeB/N5K84xDvJQd/eW9jbx97cH8mxLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197352; c=relaxed/simple;
	bh=a1/znAPVOMGvYSl25o82OKUV2aH5tav4WPnmQ9FKMlw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t6d4rYKY9Pmi2Q5zSNOZ0Kz/3yLFcWp9O73KkXXxJJmCOME8uOF4AdRUHMIiT9DKyrFmz8VxISvzvDLtLiGraNu3h8gicjFw4G3zBWgEhpo9bun8w/YzDTtSjEHqk4SS6kjaQvJeqpH8NiRysBD85xy65Uh8PZ3C4oMHfiBJXRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YshEmdCx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YshEmdCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788197350; x=1819733350;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=a1/znAPVOMGvYSl25o82OKUV2aH5tav4WPnmQ9FKMlw=;
  b=YshEmdCxx6k4ugUwy+EfV0C5aFUcFwqdma+U6m5t6tjS+Nvu3V2glXu5
   IxBytzsFLr9p7oFoG5saRFJ4QolliosnKbezJFDRGHvd2bYz4MyU9OUmx
   VsK1Oib0HaEhNvagfOQUxmadkJjntFYg6DtJb2RcDN77AqUGcfCPqJtLw
   2gy1rLufQrZmWluHCQyNDaxhRH8VQATURn01oPpezGK5xhErlXSk5vGEO
   iWJwdu+Rcv6DsxkAx2H3nu1jJ/ATeVE0gnGvNpwH7CpiQVGgt2mo3f8pv
   jiDRLICa7s5YNrCxNv4Yn1WPzFNK7cEc0O4wPw/N+o7T3sNE8VzjFROcQ
   A==;
X-CSE-ConnectionGUID: wLj9vUXhRUCk9llHaWWFKw==
X-CSE-MsgGUID: iwwuPu8YSB+8+3KUsylzlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="105985186"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="105985186"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 10:29:09 -0700
X-CSE-ConnectionGUID: gL8afe7FQ4as9lljLKc0Ug==
X-CSE-MsgGUID: nG6uwSFoRkWPwaYiZzvQow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="265143274"
Received: from unknown (HELO [10.241.243.185]) ([10.241.243.185])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 10:29:08 -0700
Message-ID: <406a5c407bbe60cafc24f715e089f5552a0791f9.camel@linux.intel.com>
Subject: Re: Cache-aware scheduling does not work well with amd big/little
 cores
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Klaus Kusche <klaus.kusche@computerix.info>, "Chen, Yu C"
	 <yu.c.chen@intel.com>, Mario Limonciello <mario.limonciello@amd.com>
Cc: "Badole, Vishal" <Vishal.Badole@amd.com>, Peter Zijlstra
	 <peterz@infradead.org>, linux-kernel@vger.kernel.org, "maintainer:X86
 ARCHITECTURE (32-BIT AND 64-BIT)"
	 <x86@kernel.org>, platform-driver-x86@vger.kernel.org, K Prateek Nayak
	 <KPrateek.Nayak@amd.com>, ricardo.neri@intel.com
Date: Mon, 31 Aug 2026 10:29:08 -0700
In-Reply-To: <369d0bbb-db7a-4f86-bee2-332d5295c452@computerix.info>
References: <2180ea5a-eb28-4152-8d4d-cd00b0c24b2e@computerix.info>
	 <8064e1d8-b51c-48e5-a312-8c31581991f5@amd.com>
	 <b475039b-defe-46e7-ab85-46e3196da667@intel.com>
	 <369d0bbb-db7a-4f86-bee2-332d5295c452@computerix.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-08-31 at 13:24 +0200, Klaus Kusche wrote:
> Hello,
>=20
> both patches in combination seem to have the desired effect.
>=20
> But I just look at a bar graph showing the current load
> of each core.=20
> The graph suggests that long-running CPU-intensive processes=20
> migrate to fast cores when fast cores become available.
> And I have the impression that LTO compilations
> finish significantly faster now.
>=20
> I don't have exact numbers or benchmarks.

Thanks for testing the fix.

If you just apply https://lore.kernel.org/lkml/20260825174112.2580942-1-tim=
.c.chen@linux.intel.com/,
with default aggr_tolerance, what numbers do you see?

That will be helpful for further tuning.  Thanks.

Tim=20

