Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1CB3B9D83
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433906; cv=pass; b=acmHK5woeQh7lQ7xgVPdo1Bh+jVl3FLCEy0f3vG9VQf+JtZtfB3kWdl5N+eaT+rN0EYVnyipHB9ZsgNY6cVlhJg5uYaztgGcmVKyzr2UgzUzDeHUHlcWGYZSDGmsc/hH2JpebuU3h13Nh+YULNUqgtuJQaEAXCeen2yhPJS6h9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433906; c=relaxed/simple;
	bh=1Uc6t1cwxW0MzD1dqSUvlR5rqITAHKLiUYzFlCfYbCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RNDy520s+KY8aNdqFUH90DrQSp6um6IEfFtfdL74qWNFizcI8tx56UUn/YTlbTkyaLlQh7/MzA36VtSCC59ja+VZcGkMrveCOC7kHW9w7/8EvBeafVvuZxdwng4TYzNi8GAdcVkfvaaHirUnN05IlviP3dy//czxCNm7z1y8pRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G8h17s9J; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=k8c1JG5A; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G8h17s9J";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="k8c1JG5A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774433903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HBOh/aoPlGxYDPbqkk5UK0G4/ytz0Hu0GxFXOarsu9g=;
	b=G8h17s9J2A17bpLlEZzx+cMqFoWKBjIwok/JGT+oyiL2v93hAn+uN4vWrMqf/bS6njEgQZ
	u/PfmWYtA1Zr7nKpg3Jdk67X9os+pigzYkdnyW9CLjLrczbeon9GJdjPgZx2NPVKG7HjvA
	ZB6mXl8lDGE/G9qCrGITbXOUFGU7xCk=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-q1olMeeNNoq4l5FURE7vcw-1; Wed, 25 Mar 2026 06:18:21 -0400
X-MC-Unique: q1olMeeNNoq4l5FURE7vcw-1
X-Mimecast-MFC-AGG-ID: q1olMeeNNoq4l5FURE7vcw_1774433901
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-79868381229so25442057b3.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 03:18:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774433901; cv=none;
        d=google.com; s=arc-20240605;
        b=gN186mqV880ZjFhUZXv56oD9tFj2DsGyGE/vs9HeMCtuv7pB/B+nsNXNyVBsrnFUZA
         w4K0z+A8nWj7tklEqjg8phxQ314rWob3Wm7Dp9TjdU3scuV7wGf8HbQK64rfWq+aBvyl
         jNBxK2FaVqmZ6FhPXVwksqDJwY8HNOIPKFbjsUjtuUexrTLAs0BjYDWvzR7Ezjjk60Oj
         IMuzb0ntxnWiKgbbTZ6oNeNbD0JhTrKa24mziDAy0+E8GvOnWS5Dv/G8uogXRBhbqszn
         9GR2UzTD/P4yqg6W8lpQM7jvP4xMEYRXns6PwGyGIFxXTgvAAJCxCn9v2+gFUvJ0pi+y
         v78w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HBOh/aoPlGxYDPbqkk5UK0G4/ytz0Hu0GxFXOarsu9g=;
        fh=NsQwXC3tjzbYGORj7EDpkmzAwfaadSNcqmNLjpg78Ak=;
        b=YAylNn+Z7P/NFlC3a1MUvHOVeEtYjJwhRrMugnKrTo1u/+1DzMhaQW3NXx/unqFocs
         jFOJlNO/ZqZXSKynP+Q2N5BxV3osMueYpBcTRTVXg9NvFIqUEfFpRJTtKNEI5ap+ipqt
         SxwRmbsDFj8X89sbqJPfg2c/MSkPRmnZJ7O1CGoxaG8AMgCw3LwwS9hYAsyqsvm69K7X
         hq27OsGCdTWjIoXopomY4EvbhfrjMloRxOkyCx/g0j1YihCZE0LE4A0srDinlsqfXJqt
         H3ad+mDPTRlXfAH/5V8+Vs1hRKzFYjvXab+kOAGvkajkfRkOMJg7R2eKs1ZoNI8oaO1a
         pClA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774433901; x=1775038701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBOh/aoPlGxYDPbqkk5UK0G4/ytz0Hu0GxFXOarsu9g=;
        b=k8c1JG5Agh13tecyye3G/dBXeSoWEHgyu20i/HK0WpMm2AFG9kpTvNrLWYqBP+O3s/
         tHypkdE43WwKBfjRLoJgSSwV99V4JVgUbpqe62RgAym0i/zybZ+6C3lcjyHkvG7RwgQV
         PSYmTY8cMZZt0Xn7dvJGsvFwP2eyWTLrNr2moqUqNvANKsHQ6NR1cr/Os+Cy+ynJGYDw
         skKrdXE3TqjJIYqbCLpwsU3qFBzYzIKuI/J5j+soiFmkxPqoSVGLWLwO9yH4op+BPHkK
         /I0y48bC3Rb0rQ4mZoKg4saqVxuUvkp8fvSXqRV6Fgz74WGfbQro9hKXX0jDY8tfid5y
         DELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774433901; x=1775038701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HBOh/aoPlGxYDPbqkk5UK0G4/ytz0Hu0GxFXOarsu9g=;
        b=OPugmKP3o3uCE/sneY1t6b1gb4x+PNb819wFUXrAxEBDsMXoMU4CEwoJCzhqOqXKB+
         rNVI2P9T0o/vTehqI/j9JmZArkOxA5YQXpOKfWqUMaCTVk7LRo+cg6WQBcuo0JGuoyF3
         a30QEHUEfiWkRmZA83jsVEEFbPDiO3QpS0g8uw6HembS+x7utliBxIYTC5g93N7tXLO5
         FJDasdKu91PCsZEdXmf/+Bv7EGZ/URJ4Ch9Le5hB4LCCcGLW8WB+Loq0wjwLUFEw+M8n
         U099C/fuhw9VhevZ+eLYi6uG+06V53wsNoQdQW4Fzsg2GG3ipjUZqYcaFSMk0P8SIXZ4
         kUzw==
X-Forwarded-Encrypted: i=1; AJvYcCUEc7sgu+HdXA1rmIFdlJqjgnh7ZQuB6O1bdTf8lDUq5XwNW/quwdcL5IIOD22hmJvPPsnIN10D5m+8WqyPGV2w1dOW@vger.kernel.org
X-Gm-Message-State: AOJu0YwYnNVNUNmhGggdVEZKiPP730rlF6n1UB1cL1G7cUKIDPKuT4PZ
	kTpMMdz4lV+3TwoNqHfFbX9P1YC4p/SbIIXZbj68ggcUBX6q/1tNkYehRbTAWlsmRDpqAyE9FMJ
	1J9fa5It2R3wNlm5Hw8MlOC7/AlD/P6SMQ/1TT8pc7Sx64kj7NYa+1yHlbACpiVg5l6GFCYGRk8
	qvmtVGD/YmNWXqTp0w+xWqEKFX+0Ilq5/IZsY5Xx+BH6L0Vb7//w==
X-Gm-Gg: ATEYQzysF7rWLI+BQKZnKF49B9wF8Acb0Ac1UHqEwV7V/J8ySjmSvT5hoEv1RuILgVB
	+qqpYAJ9gYALjNDjn/7Y4nv7ED84t+buFqpWAorjFetaf2tGjynXe2WlKt0F+I8DlRUI3+dffR3
	b7sODeKhDL0E4x1YG4VmxqZzgPtwzi50sOLpci342uvGdmByrwsruu8nNvpbNXi9cBYjAeSB5UC
	ptvCA==
X-Received: by 2002:a53:acd1:0:20b0:64c:9f60:19d4 with SMTP id 956f58d0204a3-64ed77ef1ecmr4805273d50.8.1774433900737;
        Wed, 25 Mar 2026 03:18:20 -0700 (PDT)
X-Received: by 2002:a53:acd1:0:20b0:64c:9f60:19d4 with SMTP id
 956f58d0204a3-64ed77ef1ecmr4805242d50.8.1774433900219; Wed, 25 Mar 2026
 03:18:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324005919.2408620-1-dakr@kernel.org> <20260324005919.2408620-9-dakr@kernel.org>
In-Reply-To: <20260324005919.2408620-9-dakr@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 25 Mar 2026 11:17:43 +0100
X-Gm-Features: AaiRm50qMzjkKEJ7Fkr-Roi7I1a_DrzOw3E963yu_3LAy7xQt4ygKXGG9Px12Pc
Message-ID: <CAJaqyWeuvD+XntgE9q4epQELpYYTOs1CznFn_tuOxeh_LurrcA@mail.gmail.com>
Subject: Re: [PATCH 08/12] vdpa: use generic driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
	Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Armin Wolf <W_Armin@gmx.de>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Vineeth Vijayan <vneethv@linux.ibm.com>, Peter Oberparleiter <oberpar@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Holger Dengler <dengler@linux.ibm.com>, Mark Brown <broonie@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Alex Williamson <alex@shazbot.org>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-spi@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-arm-kernel@lists.infradead.org, Gui-Dong Han <hanguidong02@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 2:00=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> When a driver is probed through __driver_attach(), the bus' match()
> callback is called without the device lock held, thus accessing the
> driver_override field without a lock, which can cause a UAF.
>
> Fix this by using the driver-core driver_override infrastructure taking
> care of proper locking internally.
>
> Note that calling match() from __driver_attach() without the device lock
> held is intentional. [1]
>
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kern=
el.org/ [1]
> Reported-by: Gui-Dong Han <hanguidong02@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220789
> Fixes: 539fec78edb4 ("vdpa: add driver_override support")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/vdpa/vdpa.c  | 48 +++++---------------------------------------
>  include/linux/vdpa.h |  4 ----
>  2 files changed, 5 insertions(+), 47 deletions(-)
>

Consolidate this logic is great, thanks!

> diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
> index 34874beb0152..caf0ee5d6856 100644
> --- a/drivers/vdpa/vdpa.c
> +++ b/drivers/vdpa/vdpa.c
> @@ -67,57 +67,20 @@ static void vdpa_dev_remove(struct device *d)
>
>  static int vdpa_dev_match(struct device *dev, const struct device_driver=
 *drv)
>  {
> -       struct vdpa_device *vdev =3D dev_to_vdpa(dev);
> +       int ret;
>
>         /* Check override first, and if set, only use the named driver */
> -       if (vdev->driver_override)
> -               return strcmp(vdev->driver_override, drv->name) =3D=3D 0;
> +       ret =3D device_match_driver_override(dev, drv);
> +       if (ret >=3D 0)
> +               return ret;
>
>         /* Currently devices must be supported by all vDPA bus drivers */
>         return 1;

Nit: Maybe all of this can be replaced by
abs(device_match_driver_override(dev,drv))? Or maybe we're putting too
much in the same line.

Either way,

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Thanks!




>  }
>
> -static ssize_t driver_override_store(struct device *dev,
> -                                    struct device_attribute *attr,
> -                                    const char *buf, size_t count)
> -{
> -       struct vdpa_device *vdev =3D dev_to_vdpa(dev);
> -       int ret;
> -
> -       ret =3D driver_set_override(dev, &vdev->driver_override, buf, cou=
nt);
> -       if (ret)
> -               return ret;
> -
> -       return count;
> -}
> -
> -static ssize_t driver_override_show(struct device *dev,
> -                                   struct device_attribute *attr, char *=
buf)
> -{
> -       struct vdpa_device *vdev =3D dev_to_vdpa(dev);
> -       ssize_t len;
> -
> -       device_lock(dev);
> -       len =3D sysfs_emit(buf, "%s\n", vdev->driver_override);
> -       device_unlock(dev);
> -
> -       return len;
> -}
> -static DEVICE_ATTR_RW(driver_override);
> -
> -static struct attribute *vdpa_dev_attrs[] =3D {
> -       &dev_attr_driver_override.attr,
> -       NULL,
> -};
> -
> -static const struct attribute_group vdpa_dev_group =3D {
> -       .attrs  =3D vdpa_dev_attrs,
> -};
> -__ATTRIBUTE_GROUPS(vdpa_dev);
> -
>  static const struct bus_type vdpa_bus =3D {
>         .name  =3D "vdpa",
> -       .dev_groups =3D vdpa_dev_groups,
> +       .driver_override =3D true,
>         .match =3D vdpa_dev_match,
>         .probe =3D vdpa_dev_probe,
>         .remove =3D vdpa_dev_remove,
> @@ -132,7 +95,6 @@ static void vdpa_release_dev(struct device *d)
>                 ops->free(vdev);
>
>         ida_free(&vdpa_index_ida, vdev->index);
> -       kfree(vdev->driver_override);
>         kfree(vdev);
>  }
>
> diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
> index 2bfe3baa63f4..782c42d25db1 100644
> --- a/include/linux/vdpa.h
> +++ b/include/linux/vdpa.h
> @@ -72,9 +72,6 @@ struct vdpa_mgmt_dev;
>   * struct vdpa_device - representation of a vDPA device
>   * @dev: underlying device
>   * @vmap: the metadata passed to upper layer to be used for mapping
> - * @driver_override: driver name to force a match; do not set directly,
> - *                   because core frees it; use driver_set_override() to
> - *                   set or clear it.
>   * @config: the configuration ops for this device.
>   * @map: the map ops for this device
>   * @cf_lock: Protects get and set access to configuration layout.
> @@ -90,7 +87,6 @@ struct vdpa_mgmt_dev;
>  struct vdpa_device {
>         struct device dev;
>         union virtio_map vmap;
> -       const char *driver_override;
>         const struct vdpa_config_ops *config;
>         const struct virtio_map_ops *map;
>         struct rw_semaphore cf_lock; /* Protects get/set config */
> --
> 2.53.0
>

