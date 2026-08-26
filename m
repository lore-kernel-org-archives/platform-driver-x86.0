Received: from mta0.migadu.com (out-121.mta0.migadu.com [91.218.175.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E940F171BB
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787775814; cv=none; b=CUdr5jZey6T+G3vFMwGWUuzENdBRXZEFXPdbjPvMYcUXYERAGMNr7emK9+NjAH+eqNyOPLGij/gczL8RaWrHjMqlDuqyP1gHFZPtV355d4rTcLukt0oORScuJhH5sskoY3X3S00Z/bTBMg1Pdww3P7/caHg9GDnKSDd4D4NMWto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787775814; c=relaxed/simple;
	bh=+5tIDpkV+WbSXADcwlZe3Jpn8o1nSYqXqaZ2dkdzkao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IzenTgT8xDJMUI+QZ6W1Az4jClUfoVgB8LnLiRDKdSei94hSZ0OFCqB33q8Urcsxe9H6ucJ8rC5Ja+o37ZI2pgwZAXxKlDPiiSDVsxcYqt7fhhKVcxS2bfgrnjS39dyNzTjr8SWbPkKGuftdH7ixu9lpDB5/nEa0X9/dI2URz2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sC79QId4; arc=none smtp.client-ip=91.218.175.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sC79QId4"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+5tIDpkV+WbSXADcwlZe3Jpn8o1nSYqXqaZ2dkdzkao=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787775808; v=1; x=1788380608;
 b=sC79QId4sMkhcQoxzVCzdZ0FFxDDwLn33hGYlEOExbuJVDXda6TYReAgfpvJ3OUjhWwlNWne
 C0MS8EucBtPLzpdVJEZHdLjGYhjbMY6LwJagb3CFjUBbt/ztfyeg25ZhmKWAHh+tvDNBPQT1uMV
 EvyHeIDYeuYPKXapxHSfKzWA=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: from dragonfly.lan (107.189.15.163)
	by smtp.migadu.com with ESMTPS id bba05da9dc43efc7;
	Wed, 26 Aug 2026 20:23:28 +0000
X-Mizu-Trace-ID: bba05da9dc43efc7
X-Migadu-Flow: FLOW_OUT
From: Ilya Gladyshev <ilya.gladyshev@linux.dev>
To: qby140326@gmail.com
Cc: W_Armin@gmx.de,
	foxido@foxido.dev,
	hansg@kernel.org,
	i@rsplwe.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	nika@nikableh.moe,
	platform-driver-x86@vger.kernel.org,
	rahulbheda131313@gmail.com,
	vlku.milos.fun@gmail.com,
	wolf109909@outlook.com,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Subject: Re: MAINTAINERS: Add maintainer entry for bitland-mifs-wmi driver
Date: Wed, 26 Aug 2026 23:23:16 +0300
Message-ID: <20260826202316.10101-1-ilya.gladyshev@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816100813.300450-2-qby140326@gmail.com>
References: <20260816100813.300450-2-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry, I had trouble with my @foxido.dev email and missed your patch.
Could you please update my email address to my[1] linux.dev one?
I was considering submitting a separate patch, but including this change
here seems more convenient and less noisy.

Reviewed-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>

[1]: https://foxido.dev/verify_email/

