Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694A5303A28;
	Mon,  1 Dec 2025 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764584906; cv=none; b=B3QXS+OMoWORDWtcSLCsrnu95mLrUy7j7CfcDWx7oKsSwCx0eFJLRG4K50zQ0fTI6WfNHUcOz5bHlEfET8oQN3spNWm5bEnDB7WTVBkeAy+mBu+SPwXe2kv0CnytEErQCD692Aw5k3ztgskbBqBwNnjjX0qEAnLa8/xQ7uxsz6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764584906; c=relaxed/simple;
	bh=qZgmuunG3GTTuWRmKJB57ZD+XqfFSIsUY4+vkUll010=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KbihvVShaZ/E2ArqP1yAAf+L7ym82t1ABIhoLCX5cO7vd5VNgBoBCU8aLb9uFs51C2KEnGCcW0roEu8KvgmvRKw/WU+9j0LKOzBzzOaiBNlXTPvQz5buNBEU5sjmJ5T4lOaTrqdQ+/LUbNrg3lnzvCpaqaKuZdJesqSv9FaD+YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFp8bAyR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFp8bAyR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764584904; x=1796120904;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=qZgmuunG3GTTuWRmKJB57ZD+XqfFSIsUY4+vkUll010=;
  b=lFp8bAyRAvkeJJcvzG40c9H6iXASMQBiqWcIqfVIjAzcKRQBXkZsFxYL
   qqPwaHYltW8DJWJdsqZPlN+rBlq5MsBEglLxPTm5dUzzBC3uQGFLP7uTC
   Esq7s9fkicCn2q+9c7ckjHy2VRsVHQ4ClbZ8OlDsylAifH+/oJE2Y7bnQ
   TwNwc70x6yyf4SiZ8rKoxcyMAlCdMkNzYXbvrPoWxUYq4hRyeioUf/26c
   MnFmRqCCuKvH+HIu7osE3Imob54hUiUyBU2QJuNlGU24EOvtM2V864QLp
   Vk5LhpzIwRzQRqGHhWECGV0y2lsIjtCsJXFbhDqhN8xUOsiA2BIH0r0X1
   Q==;
X-CSE-ConnectionGUID: QYf7axRuQnKhosc6SA0KGA==
X-CSE-MsgGUID: DJDLDV9MS3iQArcIKFP2AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66407655"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="66407655"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 02:28:24 -0800
X-CSE-ConnectionGUID: qQsBkNomSfyTNL1rG8iH6Q==
X-CSE-MsgGUID: rDIobeBKS3yYcicRoyQcJg==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.202])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 02:28:21 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>, 
 Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251129142621.152027-1-denis.benato@linux.dev>
References: <20251129142621.152027-1-denis.benato@linux.dev>
Subject: Re: [PATCH] platform/x86: asus-armoury: add support for GA503QR
Message-Id: <176458489665.9246.11859843497830419066.b4-ty@linux.intel.com>
Date: Mon, 01 Dec 2025 12:28:16 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sat, 29 Nov 2025 15:26:21 +0100, Denis Benato wrote:

> Add TDP data for laptop model GA503QR.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-armoury: add support for GA503QR
      commit: 859d4ceacfc1149f29d47bd19fe7a8f59cf6255e

--
 i.

