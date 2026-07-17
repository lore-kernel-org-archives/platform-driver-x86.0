Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83CC3AEF57;
	Fri, 17 Jul 2026 11:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287794; cv=none; b=liKvnSLPDdl4FX7qcBgUEbEhCF1BojjWVPtnPMfX9yAhANfZSZpinq7jVMxjsMs7jX7njcFAt1AlgF5I+dj1NxAQAXyIq4Dqde0v21tO477P74EF8qGFGWp3qCr6BD8MmQastZymgcQyqrvfwUm3QVip/sIyASPB2qXTrqDHv14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287794; c=relaxed/simple;
	bh=FnWLjln5PPELRk5NWwP0sl/xy9K2arrQIznTBrrBoMU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=hV9S9rAuQRW/SHavhuylzA/KSM6PgXHqVJAvVFcR2e9j1I84JyxLH/14etBFt/FuwQws59FCAMrFlVsk78ax8NG82yEuFVkplgHPr/rNPmPJCNZ5Xd3hX/GzA2ImfweIbTleslXbtdLlWU8fAtVBl2o/akhCLhJSpxS+UL1eD88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/zkVzl/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/zkVzl/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CE01F000E9;
	Fri, 17 Jul 2026 11:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784287792;
	bh=UiGewS0r9/rc8lwJRZJ7aP7KEJ5JJfNIV9hsJ7UhPls=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=m/zkVzl/QiK60y0vG/BEFhqBFPN+UlcWzhabUu7vFo9qtYsotlGFUPpfIUAErvsfQ
	 Q6WROSESwUrR+f76DLrASOXMMklJ0/q1IOGSUd4Xif8VpeGNWHFkoObNjicyRn9xBV
	 5/pv0t1EorqE9pgEJabu5wBv5XJLhgX+n8c3oHw9ihVlqBWdBXkablDmjCs57Wi6aA
	 IwVWHmcOZ2qJkNum8usqusZNOYcz2bopoxe3Yez9nDt6n4/CPyq+nN6Edve0SRIZgF
	 cLbYFfPR9TFDlEsQJr6AUUo1UDJr771zxCakvu23g53U3dmVMHzW8dVk5ePkWeDVnz
	 c/2sh4wUjCqfw==
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 13:29:47 +0200
Message-Id: <DK0T8DPQIBSQ.Z9Y2UCXE54HU@kernel.org>
Subject: Re: [PATCH v8 1/5] driver core: platform: amend the API contract
 for fwnode setters
Cc: "Maximilian Luz" <luzmaximilian@gmail.com>, "Hans de Goede"
 <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Matthew Brost" <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, <brgl@kernel.org>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <driver-core@lists.linux.dev>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260716-swnode-remove-on-dev-unreg-v8-0-5c2b8cc38c28@oss.qualcomm.com> <20260716-swnode-remove-on-dev-unreg-v8-1-5c2b8cc38c28@oss.qualcomm.com>
In-Reply-To: <20260716-swnode-remove-on-dev-unreg-v8-1-5c2b8cc38c28@oss.qualcomm.com>

On Thu Jul 16, 2026 at 2:31 PM CEST, Bartosz Golaszewski wrote:
> @@ -723,11 +725,20 @@ EXPORT_SYMBOL_GPL(platform_device_set_of_node);
>   *
>   * Assign a firmware node to this platform device. Internally keep track=
 of the
>   * reference count. Devices created with platform_device_alloc() must us=
e this
> - * function instead of assigning the node manually.
> + * function instead of assigning the node manually. This function must n=
ot be
> + * called for a platform device that already has a software node as its =
primary
> + * firmware node assigned.
>   */
>  void platform_device_set_fwnode(struct platform_device *pdev,
>  				struct fwnode_handle *fwnode)
>  {
> +	/*
> +	 * If we call this function for a platform device whose primary
> +	 * firmware node is a software node, we'll never end up calling the
> +	 * symmetric software_node_notify_remove(). There are no users for this
> +	 * right now in the tree so just disallow it.
> +	 */
> +	WARN_ON(is_software_node(dev_fwnode(&pdev->dev)));
>  	fwnode_handle_put(pdev->dev.fwnode);
>  	device_set_node(&pdev->dev, fwnode_handle_get(fwnode));
>  }

When I suggested this I actually meant to never allow to replace an existin=
g
node (not only for swnodes), as I think there's no use-case for this anyway=
 and
it makes the API more consistent.

However, this can be done in a follow-up too; the patch is fine as is, as i=
t
addresses the problem I pointed out about software_node_notify_remove() not
being called independently.

So, I'll pick this up later today.

Thanks,
Danilo
