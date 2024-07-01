Received: from mail.cock.li (mail.cock.li [37.120.193.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5864EEB5
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jul 2024 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719849689; cv=none; b=P+XbwE57ZMevAvxYqmJUEGIrQc8K7fAxNvBOuwdNl6Z6AdFlCT9djCPR0yljEVexiwfjyuSqyq/g+O4l54MO/rHvbmPa2HP+Z37459YVfFr81Z+Cb9Y7SXgK1b7cCE+3PjIcEqiTBePgppadBmpFcqcs08ZonwnZ9svooQm4GQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719849689; c=relaxed/simple;
	bh=5bxKVj1BbVK2P9X6MZxsHF+5BB73pTjKcB/XEgsbVEk=;
	h=Date:From:Subject:To:Message-Id:MIME-Version:Content-Type; b=QFZFQy1l22OhXmzgKucU4lg0WI6yCbY5QrM6YzIh8vFcPzkZIJlTljCGU8GlBSHgsJvuTME5M4bHpcMrrYtBnLeOLALhOaWQpIsMTS8HCjakwl1z2rt77v4J+nriniMPp2gXEA4Q1uvhZ3DlgNcIc7yJs5qzAB085lqIc098X+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cock.li; spf=pass smtp.mailfrom=cock.li; dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b=ELX/FE1x; arc=none smtp.client-ip=37.120.193.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cock.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cock.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b="ELX/FE1x"
Date: Mon, 01 Jul 2024 18:53:15 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1719849202; bh=5bxKVj1BbVK2P9X6MZxsHF+5BB73pTjKcB/XEgsbVEk=;
	h=Date:From:Subject:To:From;
	b=ELX/FE1xOvxRdjnVfQXKIbf4t2YumlH+eXzraRfpz3N5jX0YGZmNEzBopRNozdiGz
	 TihL+85Cpq53s9fy8DR2zy2vT3+VQ90OfnpC2f0BtKn8lPGvRb+nCDj4ln3Z/PwM9Z
	 8wj8krVnMYDlCTbMEURlAqPEkQUAU+9O7wy32oubY7xVXG3pSXOlFmZfNDk8CVT2Bi
	 HDoy4ob/8KnRq2ZS6PSPTXCe0NMNdMjUknFWd8hOe12UzXI8FIFjjhNK/5x/krsARK
	 x5Fz2Ieb6g2/yjT5lrLSzQIoU0VMDR8dk2f2ueCovt8C2fPKn20APVC12T9jA6T3b3
	 SweaQg4RXrYnw==
From: kemal <kmal@cock.li>
Subject: toshiba_acpi: fn key started working inverse in satellite L50-B
To: platform-driver-x86@vger.kernel.org
Message-Id: <R4CYFS.TWB8QUU2SHWI1@cock.li>
X-Mailer: geary/46.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed

in my TOSHIBA SATELLITE L50-B, the fn key started working
the inverse of how it should after upgrading to kernel 6.9.7
fn+function key used to emit an actual function key press, now instead
it emits a hotkey press and the key itself emits an actual function key
press. there are some recent commits to toshiba_acpi, but i cant see how
it could affect my hardware.
what could be the reason i lost the old behavior?


