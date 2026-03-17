Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465E83C6A4E;
	Tue, 17 Mar 2026 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752405; cv=none; b=UQ3CGOdjxRutKx6Q/9Jst6npFLfO2rpfWbu5nNWly6uO9ob8tJ6srwFG9xBJi2qfn/znKm7Xj5WyPQsZmVe7eFiFi0JNQpYXdrc6G+a4Ay7Ymi/cn1EBGxSAgev4RtnjemOlRjEIuYzdKz2Shdf+xEbKItlp57u8vZ4mDqoXGHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752405; c=relaxed/simple;
	bh=WM5MuWuq4gL/C1yTAIrUykS+TlyXNJlf4XmXYa3BipM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eFo8KKDmkdbMZRvoIHrA6aAmCRnv+jH9h5YacyhmJTIMvx8QTAhDJePx2cD8bcntNPq7yj1BIDQRbGHffKSq0B8aEBp3eNzyiBWTQ2cZfMtIBAahSN9SWwWxnHdHkhh8uQP+ILoUQ5CPfG9o2JTH6fD461yuWNqaLJNQE+3m934=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQ8CSC6A; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQ8CSC6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773752404; x=1805288404;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=WM5MuWuq4gL/C1yTAIrUykS+TlyXNJlf4XmXYa3BipM=;
  b=MQ8CSC6AbxN8tg/1pzrOwH/J7DemfZP12mXk6LHy+5FWLo2DHFjp6bt1
   3yDNfWW7FnNmz8kg3ZdwqVBCwaHm3VEZiccvXxABdU4VSs9lL1GwsgH0u
   cmVbER1edzJ4cH1RBeaSTwVtAtGju57/tb7WtQpumdDMRbnjGu3aSlq9L
   JKrPK9wNuqkNZSyJn87mbUv8515fnBlqT3CPK9edYv4afr0eTI00WViJt
   NcYN8o8R1WrUFR8v+ds3l2DQ+GNvasKzeFUvHqNnh0RApDUpWULj5Sb9b
   1zva3YsqwcsHc0bV1ZPbC40dCXOcYXWQSDC0YV7TNZ2p6sL2kyGF0e70S
   Q==;
X-CSE-ConnectionGUID: KS2mKdAyQ5qx5DexpRLmwg==
X-CSE-MsgGUID: q9sUQDcgSbuDvBD4EKX/vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85409097"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85409097"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:00:03 -0700
X-CSE-ConnectionGUID: 0cxw8nLvRqqVrYOjWkQ2Ag==
X-CSE-MsgGUID: ZTfFlmjtTqyoz+ZxTCyJvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221490587"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:00:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20260304141102.63732-1-denis.benato@linux.dev>
References: <20260304141102.63732-1-denis.benato@linux.dev>
Subject: Re: [PATCH] MAINTAINERS: change email address of Denis Benato
Message-Id: <177375239629.9137.13406798359198683577.b4-ty@linux.intel.com>
Date: Tue, 17 Mar 2026 14:59:56 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 04 Mar 2026 15:11:02 +0100, Denis Benato wrote:

> I have been using a linux.dev email since that is hugely better than gmail.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] MAINTAINERS: change email address of Denis Benato
      commit: 10b1c6a22e51d209f4da5d1555dec94bca88dfd2

--
 i.

