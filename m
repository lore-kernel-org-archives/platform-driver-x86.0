Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484033CEBB8;
	Fri, 24 Apr 2026 12:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035068; cv=pass; b=pCrvW1c0EPKjeR4WjNxdvhs+yOAD0cyupN549BI/zyvS9bGWvh78w11qSvhe9Xh/Tq4WcI71RwafXw/YoQck8JofO7trIitUfVMHCo97wcPtSF0raNymCepmfigKYb3zM6dWD/d47UjOMwJ7v2irwNfF1w13ZE1oM1qAl72osLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035068; c=relaxed/simple;
	bh=m91rJxmU5vJkc/2ivdwWue0xovO0yfa6JOesnmfIWL4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IejX8KYCeJRgAnJvMEf39HEwuXIuAoQPtAGNUgb30sxWo0gUWKDZtq9lfQyH8Ai9Z24Jsvgo+uXMFZsiD2UAqGUQCfgJNJf9tlXUVNAS9MV4WJa2wFjD+xtfD/SmVJl89IA1FASlQ1M/J3XT/VVfCcR5Aw4nPKk2LtHOfd/ivNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=BZpjMzJo; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="BZpjMzJo"
ARC-Seal: i=1; a=rsa-sha256; t=1777035056; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HD6YCOe6g3lU4EmzQUdms/fnimwj4qii5hB8uzXihkz5fdz/uGLG6dNIi+NNcqMLQcubOt+ht0fV7EhqkqWMGNsWXkQf8yhS7DlGniWsIiQxLuoeZ/4TBpeKu/ppXX3tTAFcNJxga39nZ91XXI8sGW2iizalY/B4r5vJBewX/2w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777035056; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=m91rJxmU5vJkc/2ivdwWue0xovO0yfa6JOesnmfIWL4=; 
	b=WzXsy26nNCxhcZQbX0fHtQMr3k4833BGWRwWfMyvCKWsv8KOU02+i9qcQ9UoXgd56U5Z7K7HQmxIt49JmDZkbHTXUswO5HFoeKTbO7fzAVQ6VV7HtI+BYLG+ZegiNzyjU39SwaYD9/aif3pq5shPwyRZtR89uqxqXIFgpH9HnL4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777035056;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=m91rJxmU5vJkc/2ivdwWue0xovO0yfa6JOesnmfIWL4=;
	b=BZpjMzJojjj+KwYBZsZ+eUdgS/aTRj7rjJsaHjOxexEJxL+wXTot30yS+/ZLgl7G
	Oqc1nAURywK0tuuOHYASW0X5W4n48Kb9h+Dic7VIKp9qy5h82s4G5pU7mFYzvUfpzkz
	4mBtzLe1UeoJgzC6viMAxHN182T/8V/Pxg8cvuIw=
Received: by mx.zohomail.com with SMTPS id 1777035054608217.76181857393317;
	Fri, 24 Apr 2026 05:50:54 -0700 (PDT)
Message-ID: <09d21c9cee8af49fa1d5b568358db0c347668ee9.camel@collabora.com>
Subject: Re: [PATCH v9 14/16] platform/x86: lenovo-wmi-other: Add WMI
 battery charge limiting
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 24 Apr 2026 08:50:53 -0400
In-Reply-To: <20260411162334.25682-15-derekjohn.clark@gmail.com>
References: <20260411162334.25682-1-derekjohn.clark@gmail.com>
	 <20260411162334.25682-15-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-ZohoMail-Owner: <09d21c9cee8af49fa1d5b568358db0c347668ee9.camel@collabora.com>+zmo_0_

On Sat, 2026-04-11 at 16:23 +0000, Derek J. Clark wrote:
> Add charge-type power supply extension for devices that support WMI
> based
> charge enable/disable.
>=20
> Lenovo Legion devices that implement WMI function and capdata ID
> 0x03010001 in their BIOS are able to enable or disable charging at
> 80%
> through the lenovo-wmi-other interface. Add a charge_type power
> supply
> extension to expose this capability to the sysfs.

Hi,

this is not the right uAPI to expose this capability.

If you check the ABI description for
/sys/class/power_supply/<supply_name>/charge_type [1], it mentions
"rate" and if you check the corresponding enum definition [2] it
mentions "speed", so the charge_type uAPI is very clearly meant to
expose the the charge rate/speed/current currently configured, with
Long Life specifically meaning a reduced charge rate, rather than
reduced charge capacity.

The uAPI you're looking for here is
/sys/class/power_supply/<supply_name>/charge_control_end_threshold [3],
which very explicitly exposes the charge threshold in percentage. You
can then accept only 100 or 80 as valid values and configure your
hardware accordingly. Unfortunately there's currently no way for
userspace to know that these are the only valid values (which is
something that I want to look into implementing soon), it can only read
back to see if what it wrote was accepted, but it's still the best uAPI
for this.

I see that there have been 2 commits merged last year that make the
exact same misuse of the uAPI, which probably contributed to the
confusion here, but the ship has sailed for those.=20

[1]
https://docs.kernel.org/admin-guide/abi-testing.html#abi-sys-class-power-su=
pply-supply-name-charge-type
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/inc=
lude/linux/power_supply.h?h=3Dv7.0&id=3D028ef9c96e96197026887c0f09242467929=
8aae8#n45
[3]
https://docs.kernel.org/admin-guide/abi-testing.html#abi-sys-class-power-su=
pply-supply-name-charge-control-end-threshold
[4]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dde2884c6cdd3d133704ce37393590dd1c761500c
[5]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dda8f2708f9b69707f4efeb432a18395e46b4666f

Thanks,
N=C3=ADcolas
