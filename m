Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E31D3DA7CF;
	Fri, 10 Apr 2026 17:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775843682; cv=none; b=JQulbwGaczEVVB5H5MMakrZcfDJTNRJVAA0NqQuxu+AijMJOJmWj4nYtjglE4eItunnrIN3axDVIKCzO+d9tzrx/gha/DJn0QZFp8f9Q0A2zk6B/c0KDCQQPcffJkLlXbFc2jK7EOq0Od36knY87eSmSqXR9vPhgLPpYNf0+N8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775843682; c=relaxed/simple;
	bh=MqLBvoNYi0mI0ASNyBkDZzutQxqyDDPJnO25m/dgpvw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bKTQawpvFLiv8Gn2a/xRgoK2UPRd67zECY8catcnQC9her3On45dABIs/8p1QISHbVyNIqj5weCMbt6KMLw3fgfuUcJfw5NoyRYalxhfAM8fWtx5hwHgrY/qZ/0FbcurTc1PR9s3JNZd5BIJk1pZhCZ4rRine+rrUibabymrHfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DHDkBeQc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHDkBeQc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775843680; x=1807379680;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=MqLBvoNYi0mI0ASNyBkDZzutQxqyDDPJnO25m/dgpvw=;
  b=DHDkBeQcEnTV70zJSN6eCAZlgWfkrPXN5FSvr9Yn8gwmV2sYkrfvl6SG
   kheqyf112htds4A33CSgi+ZEDStYt96TGeR7sQ3OMe3OXjxuJp8ousUal
   Y+cKUVZJyRyqjwjs4gjzuTDLS56kusta/gDXVNZOFOF8ZsVcFHYFjWO8C
   4KV84vOAdCF1yA6lrABfpjCbERSoeMRPYPDlGElISVRgdth7yG4FRrXXI
   kYuwDYd+OBYYWASBtYlN49meXzCalXRyX5LUlEBNT1atVLxBGdGOCFO/A
   8gYBSc+9Kvz9KXKAslc/7IcH33UIDcN4F6+iPMjgnn+KGuSFLuVJZ6UZh
   A==;
X-CSE-ConnectionGUID: GmXMcFIpRPiANsnR4UsoQA==
X-CSE-MsgGUID: ZGAKnXINRlicnHoacZ84bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87568820"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="87568820"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 10:54:37 -0700
X-CSE-ConnectionGUID: FMKVfvJoQNKpt+jvYq+XCw==
X-CSE-MsgGUID: gt6XcI6BTeCIQYkYAWu4Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="230876407"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.118])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 10:54:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, ShaunV334 <shaunvarghese43@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 plotnikovanton@gmail.com
In-Reply-To: <20260410174651.1424000-1-shaunvarghese43@gmail.com>
References: <20260402095707.64881-1-shaunvarghese43@gmail.com>
 <20260410174651.1424000-1-shaunvarghese43@gmail.com>
Subject: Re: [PATCH v2] platform/x86: hp-wmi: add Omen 14-fb0xxx (board
 8C58) support
Message-Id: <177584366844.15303.726925220985756236.b4-ty@linux.intel.com>
Date: Fri, 10 Apr 2026 20:54:28 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 10 Apr 2026 23:15:21 +0530, ShaunV334 wrote:

> Board 8C58 (HP Omen Transcend Gaming Laptop 14-fb0xxx) appears to use
> the same thermal profile handling as other supported Omen systems,
> including board 8E41.
> 
> Add it to omen_thermal_profile_boards so hp-wmi can expose the firmware
> thermal profiles through the platform_profile interface.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-wmi: add Omen 14-fb0xxx (board 8C58) support
      commit: d0e6904dc063c19e470bb505eb010eb9f1b1148a

--
 i.

