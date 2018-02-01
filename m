From: dvhart@infradead.org
Subject: RE: [PATCH v3] platform/x86: mlx-platform: fix module aliases
Date: Thu, 01 Feb 2018 15:32:37 -0800
Message-ID: <AFC4153F-288F-4357-9F89-152451CC7ED4@infradead.org>
References: <20180122142043.23705-1-ivecera@redhat.com> <AM4PR05MB33306D194CCCC526848EB342A2FA0@AM4PR05MB3330.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:58142 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751561AbeBAXcn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Feb 2018 18:32:43 -0500
In-Reply-To: <AM4PR05MB33306D194CCCC526848EB342A2FA0@AM4PR05MB3330.eurprd05.prod.outlook.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>, Ivan Vecera <ivecera@redhat.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: =?ISO-8859-1?Q?Bj=F8rn_Mork?= <bjorn@mork.no>, Andy Shevchenko <andy.shevchenko@gmail.com>



On January 31, 2018 10:10:39 PM PST, Vadim Pasternak <vadimp@mellanox=2Eco=
m> wrote:
>
>
>> -----Original Message-----
>> From: Ivan Vecera [mailto:ivecera@redhat=2Ecom]
>> Sent: Monday, January 22, 2018 4:21 PM
>> To: platform-driver-x86@vger=2Ekernel=2Eorg
>> Cc: Vadim Pasternak <vadimp@mellanox=2Ecom>; Bj=C3=B8rn Mork
><bjorn@mork=2Eno>;
>> Andy Shevchenko <andy=2Eshevchenko@gmail=2Ecom>
>> Subject: [PATCH v3] platform/x86: mlx-platform: fix module aliases
>>=20
>> Missing prefix 'pn' in MODULE_ALIAS lines causes that the module is
>not loaded
>> automatically=2E The driver should use MODULE_DEVICE_TABLE together
>with
>> existing mlxplat_dmi_table instead=2E
>
>Darren/Andy,
>Since mlx-platform is about to be modified in for-next, how to proceed
>on this
>patch? Could I resend it based on top of the latest version? =20

This patch is applied in testing already=2E


--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
