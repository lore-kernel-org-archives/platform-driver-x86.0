Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E367D4534AD;
	Wed, 15 Jul 2026 15:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128802; cv=none; b=auOb88KTjsNrkOMQOSGF8JFyzj29e8/WYzEl8Yuti+Jdgb7fNU4ZP4Hj9AY0AnsTrgs9CqZddDMFL/pY35cgODDK3b8Fm1l70g8X8DnojOh4EQ4zEd8Px4dYkjy401FKMVkITK4BGHwv1jjpVdXlxQjMdNcQgTKTA4CATos/rwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128802; c=relaxed/simple;
	bh=uPRJqOhJ5ehd7+9UhR8NT3FbaiC+PIupWZrQ/SZx09U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=dlGaMeysDfJ+C+h0c8o6SHRNs3VAof1N34HYdK7ExjClQheBwzUx/oolL4VLGuSt/8dTgWpKpwKChRUCrvv09j53P6YloVDqI89fkjYQ4cxDZuarcZ6Ys9YUDn09yoSM6IXvczzO4dJJXny9YjVh5WlVW8MlAtJm3Lj5rVZaWuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdAFpNDc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdAFpNDc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 779B91F000E9;
	Wed, 15 Jul 2026 15:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784128796;
	bh=uPRJqOhJ5ehd7+9UhR8NT3FbaiC+PIupWZrQ/SZx09U=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=DdAFpNDc88INU2wPiosqcYm01E48OL4GfhJy/jDUk5cbe0HkYVqylm3R77edrbmHq
	 71Ttib5rCGXs7rF7z5HQkaTDjzPyo530APiLcllFfGilPwXEssE0qNLLHTSdd86Uej
	 CNMFzfOdqEq3KpLBBFodc6/M5Y2m4P8ZleAY65sLAH7qFgbcqG3spOlFxKbamVL9gm
	 Bj/vWxUPWfUf6LvH19/esEN5V3lMLn1vHtb/uRaJWQYO2uzhjgc5cdzeUcV1DQTqhR
	 IDmo8q83SpfwT4teoAM+JDZz4e2zM4pwdtVW6EFOK1tg8M47GkiGHmZG43R65Dhwhp
	 C6t3A4jvPTMZQ==
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 17:19:52 +0200
Message-Id: <DJZ8VG4H46XC.36XXT1A34B0TK@kernel.org>
Subject: Re: [PATCH v7 3/4] driver core: platform: unify release path
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
References: <20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com> <20260713-swnode-remove-on-dev-unreg-v7-3-6d6bc448427a@oss.qualcomm.com> <DJXNZLE3L756.K5DYSTKM1UHT@kernel.org> <CAMRc=MfOipGdiGXNgVrJVO8QOivQ-=8k3sX-nMfTS0DvdZcFnw@mail.gmail.com> <CAMRc=MeXwaRSDJYKeoM6PfqWqRPh9KCMF8HATFvaTWUf6N6GYA@mail.gmail.com>
In-Reply-To: <CAMRc=MeXwaRSDJYKeoM6PfqWqRPh9KCMF8HATFvaTWUf6N6GYA@mail.gmail.com>

On Wed Jul 15, 2026 at 5:06 PM CEST, Bartosz Golaszewski wrote:
> On Wed, 15 Jul 2026 15:52:07 +0200, Bartosz Golaszewski <brgl@kernel.org>=
 said:
>> On Mon, 13 Jul 2026 20:45:13 +0200, Danilo Krummrich <dakr@kernel.org> s=
aid:
>>> On Mon Jul 13, 2026 at 5:11 PM CEST, Bartosz Golaszewski wrote:
>>>
>>> So, either we have to special case platform_device_set_of_node() too (f=
or the
>>> case that a swnode is set already), or just require that the function m=
ust only
>>> be called when no node has been set, as all users already do; I'd go fo=
r the
>>> latter.
>>
>> This sounds good too and it should be easy to implement another test cas=
e while
>> at it.
>
> Oh but wouldn't that require us to introduce an integer return value for =
these
> functions? Or are you talking about simply updating the API contract?

Yes, we could update the API contract; we could also consider adding a WARN=
_ON()
for the case a node is already set.

> I think calling device_remove_software_node() on
> is_software_node(dev_fwnode(dev)) in platform_device_set_fwnode() be enou=
gh
> to handle that case, right?

Yes, we can special case it, but the "replace the existing node if any" par=
t of
that function is already dead code.

So, if no one needs it now, I'd rather remove it and wait for someone to ha=
ve a
valid use-case.
