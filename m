From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH] platform/x86: mlx-platform: fix module aliases
Date: Fri, 19 Jan 2018 13:37:04 +0100
Message-ID: <87bmhq9g9b.fsf@miraculix.mork.no>
References: <20180119083156.4082-1-ivecera@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:38391 "EHLO canardo.mork.no"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754805AbeASMhU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Jan 2018 07:37:20 -0500
In-Reply-To: <20180119083156.4082-1-ivecera@redhat.com> (Ivan Vecera's message
        of "Fri, 19 Jan 2018 09:31:56 +0100")
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ivan Vecera <ivecera@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, vadimp@mellanox.com

Ivan Vecera <ivecera@redhat.com> writes:

> Missing prefix 'pn' in MODULE_ALIAS lines causes that the module is
> not loaded automatically. The patch changes them so they match
> the entries in mlxplat_dmi_table where BOARD_VENDOR and PRODUCT_NAME
> are used.
>
> Fixes: 6613d18e9038 ("platform/x86: mlx-platform: Move module from arch/x=
86")
> Cc: Vadim Pasternak <vadimp@mellanox.com>
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>  drivers/platform/x86/mlx-platform.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/m=
lx-platform.c
> index 504256c3660d..b1a5bbe4acf0 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -370,8 +370,8 @@ module_exit(mlxplat_exit);
>  MODULE_AUTHOR("Vadim Pasternak (vadimp@mellanox.com)");
>  MODULE_DESCRIPTION("Mellanox platform driver");
>  MODULE_LICENSE("Dual BSD/GPL");
> -MODULE_ALIAS("dmi:*:*Mellanox*:MSN24*:");
> -MODULE_ALIAS("dmi:*:*Mellanox*:MSN27*:");
> -MODULE_ALIAS("dmi:*:*Mellanox*:MSB*:");
> -MODULE_ALIAS("dmi:*:*Mellanox*:MSX*:");
> -MODULE_ALIAS("dmi:*:*Mellanox*:MSN21*:");
> +MODULE_ALIAS("dmi:*:pnMSN24*:*:rvnMellanoxTechnologies*:");
> +MODULE_ALIAS("dmi:*:pnMSN27*:*:rvnMellanoxTechnologies*:");
> +MODULE_ALIAS("dmi:*:pnMSB*:*:rvnMellanoxTechnologies*:");
> +MODULE_ALIAS("dmi:*:pnMSX*:*:rvnMellanoxTechnologies*:");
> +MODULE_ALIAS("dmi:*:pnMSN21*:*:rvnMellanoxTechnologies*:");

Strange.  Why do so many dmi drivers depend on such long and fragile
lists of aliases instead of simply using

 MODULE_DEVICE_TABLE(dmi, ..);

like most other drivers do?  Is there something wrong with file2alias?
If so, then I believe it would be better to fix that instead.


Bj=C3=B8rn
