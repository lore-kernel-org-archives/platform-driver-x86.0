Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.12.121.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793167065;
	b=dp7+Ge5dgr9zcwx4Lz28GXF3HksnSGb3mBeXPnZBNzYOGZVjECBpmp1ya4/Dbn0YqK3f
	 H30PTKklic+xWrd8yBc7D0M92i1biqq9qw6HQaqm4dxRdZF7my6jDit4UplANTWCb3FAf
	 RgOfr6IpWh02DoybeToas4T/Dw7ILNWY4qWogJ92y1l9VvfRznbrEhn9CJlOtL8lwzIWT
	 oqYNpWDHjwkQr6HInOIOfEN9XTbFXoheS7QkS1ryOD3bFmgr3r7gHz3QVasKL8WpIFIBp
	 71k8Gn/jbGs1Sepb1IxZhcVu8ly4uE2+4/cQakAT6Lc/6+RDIpsn8ctcp0uFOCtjiVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793167065;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type;
	bh=I3TVP25FgxxWPUQ4+ma3joDFY8pkuf+aDxUC9ajSOMQ=;
	b=2nKpTdzCrDGPmQHXFQF0nz3+rKxYgqVes3aroDISp39b0vEQetvgAR/JgPN1rz1ETPZz
	 mgggs2/bwtEUQz478nYPYzBPbMosMUmn4mz8alpWv26sZJDjDIe/1Wy3HYcX/lWHZe+hV
	 HAL/Ki45qZ+FrbmsuDtPZbD6wqyyTX5Wmb0mRA9Vvo0TjCktwHlcBz41gpkd2v0amt8ch
	 nIS8+jI0iX6mExovP6FiX6SZSgClrKXDo7ds0bW2sMkyVwWIP+P9Gta2R2sGmX183/zmN
	 J0GPJB4flC6sImKVywCXCPAN6i7ecv5mpkKRnl7u/ffOsE9WX7s/PjX0h99V3tSHIVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=barrensea.org;
	spf=pass smtp.mailfrom=barrensea.org;
	dkim=pass header.d=barrensea.org header.i=@barrensea.org header.a=rsa-sha256 header.s=mail header.b=IKGELVfO;
	arc=none smtp.remote-ip=198.12.121.168
Received: from mail.barrensea.org (mail.barrensea.org [198.12.121.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810CD606A31A;
	Wed, 28 Oct 2026 05:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 810CD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barrensea.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=barrensea.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=barrensea.org header.i=@barrensea.org header.a=rsa-sha256 header.s=mail header.b=IKGELVfO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=barrensea.org;
	s=mail; t=1793167057;
	bh=I3TVP25FgxxWPUQ4+ma3joDFY8pkuf+aDxUC9ajSOMQ=;
	h=From:To:Cc:Subject:In-Reply-To:References;
	b=IKGELVfO+PwQeZEFDe6hwuQBahvFcXsUJtkPzT4ik7JpIpd1+TB6CAAlLuvdV2p3H
	 NnkDhUsIfRwevDm4P2WjvnliafiOJNqzo4gn3v2tsga+7Tssm+gE6BUYNnd92AWVlD
	 Lw4twMFgUl7q0GLzbecWqX4mvW44MwadfLEbvPCSHhrjD/4VdHmoxYoIcHyEKaEyD/
	 c4gf1qTKs573kNl442iplGBitHA/BceQ7ixAFxFHfFfY7HFwmu8UNmYYMfapXBRgpx
	 FCLOj4u4Jox+BQdjnT+C1tOGqf0pCsw16n5yTrp/gFRkXJ7ThDwHXLI4vqFjT4TjF+
	 gI8cMQLjNytCQ==
From: Yifei Yao <donplat@barrensea.org>
To: W_Armin@gmx.de
Cc: hansg@kernel.org,  ilpo.jarvinen@linux.intel.com,
  platform-driver-x86@vger.kernel.org,
  linux-kernel@vger.kernel.org,donplat@barrensea.org
Subject: Re: [PATCH v4] platform/x86: uniwill-laptop: Add support for
 MECHREVO WUJIE Series 15 X Pro
In-Reply-To: <20261016120858.1752908-1-donplat@barrensea.org>
	(Donjuanplatinum's message of "Fri, 16 Oct 2026 20:08:57 +0800")
References: <305b37f0-b1c0-911a-0a07-42f6c4a51b85@linux.intel.com>
	<20261016120858.1752908-1-donplat@barrensea.org>
Date: Wed, 28 Oct 2026 13:57:32 +0800
Message-ID: <8733tqpdtf.fsf@barrensea.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Hello Armin,

Gentle ping on this PATCH. Could you pls take a look?
