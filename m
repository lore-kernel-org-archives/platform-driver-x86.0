Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA9926E710;
	Wed, 15 Jul 2026 15:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128309; cv=none; b=jUfGp9Hivn3lNPvcz5JRic4EvLe+I4avXX4WAadYpomUn1QPcWsnOooSb2/To4Xu4PwOFsTe98rZzIKFnQLfJ/HH2PsshXWRbUZotPg48P3IExKXI5cn0Z/WPDV7XSPBmAPfP7RFp4mqg7oTE9Li5BkxMi71c7Q4QEJGPqVwQrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128309; c=relaxed/simple;
	bh=bK8ADpufHykhyGjZqXA9gOnibXHv7UCjrfkQpUUXc18=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Gqnla8NFSiQbZ8AxKSRl0/a2PDDzjlLjLWSENW96aGJvzStcckDxPIBDfBABMprKryPUFkJ40cDzPjKIQHFkEy+uKVXdcdAantzORF8c6NMyBTiKRhNwscnpkEiyTq++Uf/OgbVfSDy3JqdQarWQidPrbjYTJRiMzCFXAxEpgr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EEfAYH8h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EEfAYH8h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E181F000E9;
	Wed, 15 Jul 2026 15:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784128308;
	bh=bK8ADpufHykhyGjZqXA9gOnibXHv7UCjrfkQpUUXc18=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=EEfAYH8hZmzsEJAv6QA432X8rQlI36ttqK3JEO2LNoVYQurFHw4Xfs5STaCQHUOep
	 VHPPY4i4If1ArPH77ow3qary+3f1ixlXLtq9JchkmIf6cFvA4eGtHxep6pdnl9QbLA
	 Ywpu1irtaba+oy2or8r5arXpKDzK5mItmhk6grdrnjozBgctWMv63WUjBv0joTiLE8
	 82JZx0LyXmqtNs9ctD/ajCdnQX9apbutmFMMqt5LH3xWBxd6dcs5RQeSCdX2ThLix/
	 HyDLYcvETE9DGrDrZAPrZjFJAftwRpOLP3h8SSznEYQGu88jQlNU712x1ROTI+ZeY2
	 TpUrpUfbmzQwg==
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 17:11:43 +0200
Message-Id: <DJZ8P7K69K64.1OQMMM4O8AA7I@kernel.org>
Cc: "Maximilian Luz" <luzmaximilian@gmail.com>, "Hans de Goede"
 <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Matthew Brost" <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, <platform-driver-x86@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <driver-core@lists.linux.dev>, "Bartosz
 Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
To: "Bartosz Golaszewski" <brgl@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v7 3/4] driver core: platform: unify release path
References: <20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com> <20260713-swnode-remove-on-dev-unreg-v7-3-6d6bc448427a@oss.qualcomm.com> <DJXNZLE3L756.K5DYSTKM1UHT@kernel.org> <CAMRc=MfOipGdiGXNgVrJVO8QOivQ-=8k3sX-nMfTS0DvdZcFnw@mail.gmail.com>
In-Reply-To: <CAMRc=MfOipGdiGXNgVrJVO8QOivQ-=8k3sX-nMfTS0DvdZcFnw@mail.gmail.com>

On Wed Jul 15, 2026 at 3:52 PM CEST, Bartosz Golaszewski wrote:
> Does it sound fine?

Yes, sounds all good to me, thanks!
