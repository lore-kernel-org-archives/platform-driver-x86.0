Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFF52459E1;
	Sat, 26 Sep 2026 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437261; cv=none; b=PqmuFnzg9GklgHfyB+TvWdZrhM/O2Yv+8yOOPXNybRWxDX3wOcw2R4LWqlbkICIAvGrb988n7+eLeFzzF0gWxyejNIljzbcB5kDDHUzpcSL0SqNX4c17L6MF5qiOaqpUTv0QTdkLdxCOWqXZsXQ3Lvzh4teHztyBkT6GzdmKjzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437261; c=relaxed/simple;
	bh=QRIkbTcsdJCyt2wiOKaoqvt1nEcoFrhglVg+khuM7nc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RcXUhcnS5s2FVq0516l7J7KLloOWtue47g7OI494JZ8DC2H43BRFcxi2RQIgWMtB7x4Wp4qavx2cBfGkzoqKqyS54wbSov9Q3RSYwOtFyD2n7iRrl6UB/lpjHvMmVboXBvmQlLGwJwUmvfjnZDBZeBdHEdkywqT+sL6hIdRKn6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jG8z1S9d; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jG8z1S9d"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0D558408B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790437259; bh=25nhOm8z5BXPzVRdplIVnQQpz8wmASuadILxUCunVu0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jG8z1S9dAXfBqDYCZmQ/Y84NmF7Vtn0XN2m9pfgi+RTP70LU9HrVFE6oKdeG7QYFL
	 KmmLwUAl4V0+oNk0Pab0YoeTd1g49aM1PUyPvGNNCOYtIZd4pUztPeyrf7rJMwtRBg
	 ZJ4y3HV0ftbNaDVPAqbmAHZM7aF08ZYdIQSXqHi3JaEfncpgGBpTNoHe8GlFmr3EzH
	 1FIsKhUbzI8zTYVfQw7cQBcT8oBs/+JLLe87kbFC19hMaFpvU2u3TQ0QjgNU5C+5Vc
	 Gq2gSLqHM8C0ZjvAqSE/ROSv2OEyfS4WCFMJwykBJoGam5WRyJanwVWE8jpAwwdR1d
	 dgt3/oLDelVIQ==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0D558408B3;
	Sat, 26 Sep 2026 15:40:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Jithu Joseph
 <jithu.joseph@intel.com>, Hans de Goede <hdegoede@redhat.com>, Tony Luck
 <tony.luck@intel.com>, Ashok Raj <ashok.raj.linux@gmail.com>, Ilpo
 =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/ABI: IFS: use literal blocks for commands
In-Reply-To: <20260921044746.94316-1-rdunlap@infradead.org>
References: <20260921044746.94316-1-rdunlap@infradead.org>
Date: Sat, 26 Sep 2026 09:40:58 -0600
Message-ID: <871pag3trp.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Randy Dunlap <rdunlap@infradead.org> writes:

> Use literal blocks for console I/O to separate it from the
> surrounding text. Otherwise the lines run together, without any
> clear break before or after the commands.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jithu Joseph <jithu.joseph@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Ashok Raj <ashok.raj.linux@gmail.com>
> Cc: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Cc: platform-driver-x86@vger.kernel.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
>
>  Documentation/ABI/testing/sysfs-platform-intel-ifs |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied, thanks.

jon
