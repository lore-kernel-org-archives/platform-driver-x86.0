Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5882E3126DF
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jul 2026 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123531; cv=none; b=hutGEx0evXU3v8ELsvfkWkmyRii4VAjuvK/ZSmX/grMqVyX+doIP4SKWG5T871aROlnGjG2IEhNu9l6joKZvgNIchx2ElvWXGwMAFWJwdB1Fq+uyLUQp/hqaV5lq7Gv4C9ZKLi1nEd5Uh5AnypVC7/SXoYYbLm3zHrVD2BNwcsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123531; c=relaxed/simple;
	bh=bKwjUHwKtVYGmEPODLjinnmorK8YfWqZz5++Fo4yjMU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FyyHmoBjNDc6C4MFteqvJcrzQiVac56EgZaXMUXRnriRWBBOCd6as3z4uE5eFdKkslSHhU2v1em8oMPpJ/7RQ1mk002t92nSUzdTRnmUIlcVXYXXqNv27OoSimyS5zUrv6FOyk70+p7uQ3qdVWiOndLiZIdWjYkmik664P5sgBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Obd1kB0R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Obd1kB0R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129841F00A3E
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jul 2026 13:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784123530;
	bh=azN6PoEIS9LfZk2P/YaRoMe+czqWWeq+Sdt+A5Yl6qs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Obd1kB0RmSScjgzeb59fQpD62Fu23+y3VjrRAj05lzZVP+1Sn8vuVs+qemxHdKhks
	 PKYATOCRXroNFprLz1coLTe1H05bTB/pW6c2WKi0voRd73qFjDC0JTlwwSx7IzrHnv
	 CbJz0Wzo95M70WmZS+GqedhIO9MWpCKbBvWW1fR6zp8x6kqwko5qognaGsbMDlzFrH
	 SpwMXiUYpauHqKf5t0h5pX8ZPWusEImpvt6k31oFekMvB3kD73YgVatF0sGB8fKVVr
	 RQeyY0zLICOuoNPQNsH/xeDt5vZrA2LbM8sEZ66aR+AOGgs7qil4o1FQy02FSbG0DL
	 TppZ/70E9iEtw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39ca300db70so34527881fa.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jul 2026 06:52:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpwQ1jYIqChQBJPOTxlKVUi/IdX+sC3q5q6cuM2IKmfBCmBuJgQP46oktTQBUqIfpy+rbeCj4jZLwCDFn9J4f/7nDN/@vger.kernel.org
X-Gm-Message-State: AOJu0YzbaeE5KAp6/MH8SS8wQwhHZBE7QJJ3KJUr/oC7IV9piEDJ1nMw
	R96pJj+L0n7qQSNnD5+WFK4YJx5iaPria+ESExsH3fLA237IPSD9peo0z3+6xNPLBqTyE0xhYH6
	o6HJkQIKi0AT+AyBpWiVq+Z8SZJ+5Wpv088glU5PKYg==
X-Received: by 2002:a05:651c:1601:b0:39d:b075:87a3 with SMTP id
 38308e7fff4ca-39db6d599bcmr6782921fa.26.1784123528581; Wed, 15 Jul 2026
 06:52:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 06:52:07 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 06:52:07 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <DJXNZLE3L756.K5DYSTKM1UHT@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com>
 <20260713-swnode-remove-on-dev-unreg-v7-3-6d6bc448427a@oss.qualcomm.com> <DJXNZLE3L756.K5DYSTKM1UHT@kernel.org>
Date: Wed, 15 Jul 2026 06:52:07 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfOipGdiGXNgVrJVO8QOivQ-=8k3sX-nMfTS0DvdZcFnw@mail.gmail.com>
X-Gm-Features: AUfX_mwLjyY3AEZtFtbz482J96bfO_ODnTKAvgp169Ox6LYhT2Q7uUCdbTAQuQk
Message-ID: <CAMRc=MfOipGdiGXNgVrJVO8QOivQ-=8k3sX-nMfTS0DvdZcFnw@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] driver core: platform: unify release path
To: Danilo Krummrich <dakr@kernel.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, brgl@kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Jul 2026 20:45:13 +0200, Danilo Krummrich <dakr@kernel.org> said:
> On Mon Jul 13, 2026 at 5:11 PM CEST, Bartosz Golaszewski wrote:
>> @@ -599,6 +599,7 @@ static void platform_device_release(struct device *dev)
>>  	struct platform_object *pa = container_of(dev, struct platform_object,
>>  						  pdev.dev);
>>
>> +	device_remove_software_node(dev);
>>  	fwnode_handle_put(pa->pdev.dev.fwnode);
>
> This technically changes the semantics of platform_device_set_fwnode():
>
> Previously it took an additional reference count for the fwnode pointer passed
> to it. But now, *iff* the fwnode is a software node it consumes the callers
> reference count, which for obvious reasons isn't great.
>
> Now, platform_device_set_fwnode() is unused now, so we could just get rid of it,
> which also gets us rid of its asymmetric semantics.
>

Ideally we should convert all users of platform_device_set_of_node() to
platform_device_set_fwnode() and remove the former instead of the latter.

I agree it's not optimal for it to be unused now but I can start converting
the users of platform_device_set_of_node() once this one's in the driver core
tree.

> However, couldn't we also just move the if (is_software_node(pdevinfo->fwnode))
> conditional up here, such that we have:
>
> 	device_remove_software_node(dev);
> 	if (!is_software_node(dev->fwnode))
> 	    fwnode_handle_put(pa->pdev.dev.fwnode);
>
> This way, the swnode special case would go away. Well, at least the "two
> reference counts" special case.
>

Sounds good.

> Another special case I just noticed still remains, but is independent of this
> change:
>
> If platform_device_set_fwnode() or platform_device_set_of_node() is called for a
> device that already has a swnode set, we only call fwnode_handle_put(), but
> software_node_notify_remove() etc. isn't called.
>
> Of course that never happens, but it is an inconsistency in the API. Now, it
> seems that neither platform_device_set_fwnode() (which we should remove anyway),
> nor platform_device_set_of_node() is ever called with a fwnode already set.
>
> So, either we have to special case platform_device_set_of_node() too (for the
> case that a swnode is set already), or just require that the function must only
> be called when no node has been set, as all users already do; I'd go for the
> latter.

This sounds good too and it should be easy to implement another test case while
at it.

>
> If my proposal about moving the is_software_node() check into
> platform_device_release() holds, it would probably be good to just add those
> patches in a subsequent version, otherwise I'm happy to pull this in as is and
> address the other stuff subsequently.
>

As I said: I prefer to keep platform_device_set_fwnode() and work on using it
exclusively and drop platform_device_set_of_node(). If this is not urgent then
it can wait until v7.3-rc1 where we'd have all this upstream, then I could send
individual patches per subsystem tree and we'd drop
platform_device_set_of_node() once there are no more users. Does it sound fine?

Bart
