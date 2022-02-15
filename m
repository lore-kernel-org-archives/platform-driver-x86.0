Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B18C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Feb 2022 23:31:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243780AbiBOXba (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Feb 2022 18:31:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241137AbiBOXb3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Feb 2022 18:31:29 -0500
X-Greylist: delayed 64 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 15 Feb 2022 15:31:16 PST
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1972F94EF
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Feb 2022 15:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
        t=1644967875;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=JH4DcdlXdKh0tEFIxGFe5z2Axy/b5pOoBhxo8CG4QtQ=;
        b=BLBg5dC4rHsPPXL20sNZvNkAnlnK0IYVzG0TaCSvWAn1BcTloRaKQpK/+im6i8FVdRO27/
        ZlbTXj/TFeuM0gGZV9HkfWK9AoU810EasVLzFfdTdAWaFon1ITe44oA/p9YG0+zIZ92zaT
        9qjzZXrQxqB//44u6trjhyhnS53wb/A=
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-dzPpyQKIM7Cj5QsZTYL90Q-1; Tue, 15 Feb 2022 18:30:09 -0500
X-MC-Unique: dzPpyQKIM7Cj5QsZTYL90Q-1
Received: from PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:160::10)
 by MW5PR84MB1820.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 15 Feb
 2022 23:30:08 +0000
Received: from PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d4a1:2073:e2e4:f381]) by PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d4a1:2073:e2e4:f381%5]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 23:30:08 +0000
From:   "Lopez, Jorge A (Thin Clients)" <jorge.lopez2@hp.com>
To:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH] Fix SW_TABLET_MODE detection method
Thread-Topic: [PATCH] Fix SW_TABLET_MODE detection method
Thread-Index: Adgiw/Z47mhT1PhhR0+Ea9GWRYkByg==
Date:   Tue, 15 Feb 2022 23:30:07 +0000
Message-ID: <PH0PR84MB1953F1704CFE3BCF03203A3AA8349@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: abc4664a-3d48-4301-90a7-4f22abbcb809
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42108b8d-6d10-4475-2d2e-08d9f0db1a66
x-ms-traffictypediagnostic: MW5PR84MB1820:EE_
x-microsoft-antispam-prvs: <MW5PR84MB1820EF6D134A0B1B152F19F7A8349@MW5PR84MB1820.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: WE0NQ9S8lRrqgnZe6WrdR0D0n1kWFS163QAfDAKejo8xEMgSu9rrWbFA8ooDgcOXIRrdTm+0SEnDI19DDUzSNg+kzW8ubAN4bWUiuQzDNGhWuDIssArJq9Z4qbEpht64t7biNDbJGx/28Ykbkl/v5GDTAVfySKmTa5OuhFKPui11ocTt+cTeQuUr5XbVhdQAZDbpbxqob7rF5E1TTfJaq0jPpQinxjnql4og44fEHhthgJRSGUBYPoCMdfiYb2lHwGLmKF3X/fvpnn8lVUc5X8NIevo9NLGVzakhCmnngn5tHUhv0FQIeuhHoaOT3Z2ULP9vDzj3G8Qvk1RGQySsNwp9CnOwVP5n19ECfGP/awfblTdQeSmQVB6vYXtcMQcSqbh6gSCiBgeJvJgefz2hx1KqymhH7mxep7HYvlvSxIxCGl5wgInvnU+tEu8JNLGi7jdKKpsR8lu+Rc8/hAKJNmi7bo1akk5EMnw6VOPhyc57LW7ilzMLo/8eBV/fOskiOcDxzj6ogd0caLkfsVOp8loMeyB4z+TTkIO/brvsmsupM2Zyl5pr3H8Tc8PvX40W0bNabwWMiXYHVDcPip9nhtoHQq+EasIua57XYMLXT2AImuxsNizslfDTMJp6ndmiD/7NEif9voYU2LwXJ6qMO2UcieaLH79JpJDHRaicvoNqxdbnZiQDUSCeSxLgGSN76YGuZyZ46zFYtUNIjPcz8w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(33656002)(6506007)(508600001)(38070700005)(2906002)(76116006)(6916009)(38100700002)(316002)(7696005)(9686003)(122000001)(66446008)(52536014)(83380400001)(86362001)(186003)(82960400001)(26005)(66476007)(8936002)(66556008)(5660300002)(53546011)(71200400001)(8676002)(55016003)(64756008);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ne/AbCI4hXkIAnV9SeI6Zm+IcBHwmV/WBbJ0lHlqo2x3/TmnuF4LEGZEwVxZ?=
 =?us-ascii?Q?HTlvvKUacoeEV9Zy5f+Fy/31XtGOHF0+vxJCwmKYVDaRiVd+xEuEkrMH1/5W?=
 =?us-ascii?Q?4Zi+QXkIhxBg8JVkfh4yY31SxF3aK1JCjt5SG5lQSTtEJQf7XMe9GUknS3WO?=
 =?us-ascii?Q?+p7qaCx1pNthTcIZBJGGNn+uUfMty1meuYO7EHpG08/u0Fl1jI6mHBZnLlM0?=
 =?us-ascii?Q?XvdV/bsyHypEXXLL2yyVbuiT+ojJ/i1FKiQh1AlKDFQe+5wJJuGC6KWnq2jP?=
 =?us-ascii?Q?JBG6+f+gWCB8otxBkms4+ubNYeUoY9tn24rI6XAvvb3Xl6wDHDLYssdS2AIL?=
 =?us-ascii?Q?LnUj/CuHulsdpldueGCybhXUxeDRU79WeD/78QFZm9Hf/6JKf4RXOIOwBA6h?=
 =?us-ascii?Q?ojyOjCXSFY1J15eLV+SGYe/t7YoWo7z0X24Nn79SRBTWcTOzN8IuPYRvrcIg?=
 =?us-ascii?Q?oWKORSGAQLyktQmA8geW9QEP8KUV4v3cqK91tKRtLHf+Fo1oUlqtsPubt40H?=
 =?us-ascii?Q?YZhoI/sN13pDdI3i+7zZLLhO1uXQmNPqe4I0EBusn38tatWpN+UiVAfPELxz?=
 =?us-ascii?Q?Gx/Pk1H/54l8h8dYprgOF3AoCpA3pZeSJurknE/XwmRluprj54c3T7tgXBCY?=
 =?us-ascii?Q?SlCUNAuQr0IN7NgXSArViJgT5JkI4jnTQXWMhi+Ha0y2sK9mowTYKK9q6lFD?=
 =?us-ascii?Q?uLQUb1kvQEnn8neCb4d9AQ6sksFT3U7Q0vVsI7d69Og47QvXN9Vcwqibsp3x?=
 =?us-ascii?Q?ePWtF+6WJvd6nsLE7/SsmRdCS22Bo1N0oAkNdJKMmnudHMEeva8FkLmnotqo?=
 =?us-ascii?Q?+vO6aB+i+kYnidRqErdntwu5ptOR0IAORzTu2gOKkRAlhoi3zSdpbRQuU/gx?=
 =?us-ascii?Q?iJ9rsXGguGUccLUNy2/DNCNfqpveSOUBAT8BsChmLvq89U3Lym/JIyAa4+iD?=
 =?us-ascii?Q?fSaguf3fP3hjHl9dkKqC/bfChIUAX8uQUh+LL+ddIssbcur4ucxcJaZLFkst?=
 =?us-ascii?Q?kZhww2S8xSijTJo0+39rVQMsyW7IG9rI9pYfEE5++c7Afnw91/KZnKWn/Tlq?=
 =?us-ascii?Q?9IuujI9Za2AaXjB+SzsxNBWR+Kdeme2rBc5YjxSa5P1lKmYoqV/BnLygFC6H?=
 =?us-ascii?Q?c54ObHEKlSGBfF3MTPuy3Zq/JTRuNzb0V7NaNHgvfL1sZUDrD71n70fskLLF?=
 =?us-ascii?Q?/L0pQwb7M09NF0KKF8dft/jKp24Zcao8BQ4exAym2H+M0DRCytyT172FdsE6?=
 =?us-ascii?Q?Hun4DZD6YNzsZHxVPFn4jT966oSxpXDTQAlLhQfZ5xIyuKtcBdFfsSbkRY1C?=
 =?us-ascii?Q?T6RbKJsfhCPnoRgKwzH+jURmHXoUDn/A/EpDzcmlchrfhSxZMmBCgvPn7ecp?=
 =?us-ascii?Q?r5aHX72aTDiwvkDypdgHxi+nHNyf0RKGTYhzSNcveoZhAOLsj3tYQkiggo+e?=
 =?us-ascii?Q?bMEni+005cYNwGeDJavVzo3Hw2UPUE01iwfj6IUxPer7j28RR/Y6tiQN3foP?=
 =?us-ascii?Q?1q3W2ETCXGEJIDT4yBAAU7DVtvzRwEQZXQB0yab3Uz55rg7PuoDi3GDkE/7u?=
 =?us-ascii?Q?aDp8L1NoNMB3HkRqQ3mnCirO2suDbnWtJg9k0xqhdMYEUA3NJib+OjXU/Z9a?=
 =?us-ascii?Q?2A=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 42108b8d-6d10-4475-2d2e-08d9f0db1a66
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 23:30:07.9636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QML04ScHGvDktnOI0nhwxQ5qb4WL5bUL1rAkIWwcmUfYckK8zQh9AmzCgrL7TZmuyG9uu+yY3gvboWpTwCTbGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1820
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA62A171 smtp.mailfrom=jorge.lopez2@hp.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From ca8e079fe91263edd79044c9a114f22d9f251987 Mon Sep 17 00:00:00 2001
From: Jorge Lopez <jorge.lopez2@hp.com>
Date: Tue, 15 Feb 2022 16:10:27 -0600
Subject: [PATCH] Fix SW_TABLET_MODE detection method
To: platform-driver-x86@vger.kernel.org

The purpose of this patch is to introduce a fix and removal
of the current hack when determining tablet mode status.

Determining the tablet mode status requires reading Byte 0 bit 2 and 3
as reported by HPWMI_HARDWARE_QUERY.  The investigation identified the
failure was rooted in two areas; HPWMI_HARDWARE_QUERY failure (0x05)
and reading Byte 0, bit 2 only to determine the table mode status.
HPWMI_HARDWARE_QUERY WMI failure also rendered the dock state value invalid=
.

Several WMI queries leverage hp_wmi_read_int function to read their data.
hp_wmi_read_int function returns the appropiate value if
the WMI command requires an input and output buffer size values
greater than zero.  WMI queries such HPWMI_HARDWARE_QUERY,
HPWMI_WIRELESS2_QUERY, and HPWMI_FEATURE2_QUERY requires calling
hp_wmi_perform_query function with input buffer size value of zero.
Any input buffer size greater than zero will cause error 0x05 to be
returned.

A limiting factor discovered during this investigation was the
struct bios_args.data size restriction.  The data member size limits
all possible WMI commands to those requiring buffer size of 128
bytes or less.  Several WMI commands and queries require a buffer size
larger than 128 bytes hence limiting current and feature supported by
the driver.  It is for this reason, struct bios_args.data changed and
it is dynamically allocated.  hp_wmi_perform_query function changed to
handle the memory allocation and release of any required buffer size.

All identified problems were resolved and their correct operation
validated on a ZBook Workstation notebook.  Additional validation was
included to ensure no other commands were failing or incorrectly handled.
---
 drivers/platform/x86/hp-wmi.c | 122 ++++++++++++++++++++++------------
 1 file changed, 79 insertions(+), 43 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 48a46466f086..5320c1eb5cfc 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -35,9 +35,6 @@ MODULE_LICENSE("GPL");
 MODULE_ALIAS("wmi:95F24279-4D7B-4334-9387-ACCDC67EF61C");
 MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
=20
-static int enable_tablet_mode_sw =3D -1;
-module_param(enable_tablet_mode_sw, int, 0444);
-MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting (=
-1=3Dauto, 0=3Dno, 1=3Dyes)");
=20
 #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
 #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
@@ -86,12 +83,17 @@ enum hp_wmi_event_ids {
 =09HPWMI_BATTERY_CHARGE_PERIOD=09=3D 0x10,
 };
=20
+/**
+ * struct bios_args buffer is dynamically allocated.  New WMI command type=
s
+ * were introduced that exceeds 128-byte data size.  Changes to handle
+ * the data size allocation scheme were kept in hp_wmi_perform_qurey funct=
ion.
+ */
 struct bios_args {
 =09u32 signature;
 =09u32 command;
 =09u32 commandtype;
 =09u32 datasize;
-=09u8 data[128];
+=09u8 data[0];
 };
=20
 enum hp_wmi_commandtype {
@@ -127,6 +129,7 @@ enum hp_wmi_command {
 enum hp_wmi_hardware_mask {
 =09HPWMI_DOCK_MASK=09=09=3D 0x01,
 =09HPWMI_TABLET_MASK=09=3D 0x04,
+=09HPWMI_DETACHABLE_MASK=09=3D 0x08,
 };
=20
 struct bios_return {
@@ -260,39 +263,47 @@ static int hp_wmi_perform_query(int query, enum hp_wm=
i_command command,
 =09struct bios_return *bios_return;
 =09int actual_outsize;
 =09union acpi_object *obj;
-=09struct bios_args args =3D {
-=09=09.signature =3D 0x55434553,
-=09=09.command =3D command,
-=09=09.commandtype =3D query,
-=09=09.datasize =3D insize,
-=09=09.data =3D { 0 },
-=09};
-=09struct acpi_buffer input =3D { sizeof(struct bios_args), &args };
+=09size_t bios_args_size =3D sizeof(struct bios_args) + insize;
+=09struct bios_args *args =3D NULL;
+=09struct acpi_buffer input;
 =09struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
 =09int ret =3D 0;
=20
-=09mid =3D encode_outsize_for_pvsz(outsize);
-=09if (WARN_ON(mid < 0))
-=09=09return mid;
+=09args =3D kmalloc(bios_args_size, GFP_KERNEL);
+=09if (!args)
+=09=09return -ENOMEM;
=20
-=09if (WARN_ON(insize > sizeof(args.data)))
-=09=09return -EINVAL;
-=09memcpy(&args.data[0], buffer, insize);
+=09input.length =3D bios_args_size;
+=09input.pointer =3D args;
=20
-=09wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
+=09mid =3D encode_outsize_for_pvsz(outsize);
+=09if (WARN_ON(mid < 0)) {
+=09=09ret =3D mid;
+=09=09goto in_free;
+=09}
=20
-=09obj =3D output.pointer;
+=09/* Avoid unnecessary copy to the data buffer if input buffer size is ze=
ro */
+=09if (insize > 0)
+=09=09memcpy(args->data, buffer, insize);
=20
-=09if (!obj)
-=09=09return -EINVAL;
+=09args->signature =3D 0x55434553;
+=09args->command =3D command;
+=09args->commandtype =3D query;
+=09args->datasize =3D insize;
=20
-=09if (obj->type !=3D ACPI_TYPE_BUFFER) {
+=09ret =3D wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
+
+=09obj =3D output.pointer;
+=09if (!obj) {
+=09=09pr_warn("query 0x%x returned a null obj 0x%x\n", query, ret);
 =09=09ret =3D -EINVAL;
-=09=09goto out_free;
+=09=09goto in_free;
 =09}
=20
-=09bios_return =3D (struct bios_return *)obj->buffer.pointer;
-=09ret =3D bios_return->return_code;
+=09if (!ret && obj->type =3D=3D ACPI_TYPE_BUFFER) {
+=09=09bios_return =3D (struct bios_return *)obj->buffer.pointer;
+=09=09ret =3D bios_return->return_code;
+=09}
=20
 =09if (ret) {
 =09=09if (ret !=3D HPWMI_RET_UNKNOWN_COMMAND &&
@@ -301,6 +312,12 @@ static int hp_wmi_perform_query(int query, enum hp_wmi=
_command command,
 =09=09goto out_free;
 =09}
=20
+=09if (obj->type !=3D ACPI_TYPE_BUFFER) {
+=09=09pr_warn("query 0x%x returned an invalid object 0x%x\n", query, ret);
+=09=09ret =3D -EINVAL;
+=09=09goto out_free;
+=09}
+
 =09/* Ignore output data of zero size */
 =09if (!outsize)
 =09=09goto out_free;
@@ -311,6 +328,8 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_=
command command,
=20
 out_free:
 =09kfree(obj);
+in_free:
+=09kfree(args);
 =09return ret;
 }
=20
@@ -347,12 +366,19 @@ static int hp_wmi_read_int(int query)
=20
 static int hp_wmi_hw_state(int mask)
 {
-=09int state =3D hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
+=09int state =3D 0, ret;
=20
-=09if (state < 0)
-=09=09return state;
+=09ret =3D hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_READ, &state,
+=09=09=09=09   0, sizeof(state));
+=09
+=09if (ret)
+=09=09return ret < 0 ? ret : -EINVAL;
=20
-=09return !!(state & mask);
+=09/* determine if Detachable mode is enabled */
+=09if (HPWMI_TABLET_MASK =3D=3D mask)=20
+=09=09state =3D (state & HPWMI_DETACHABLE_MASK );
+=09
+=09return (state & mask);
 }
=20
 static int omen_thermal_profile_set(int mode)
@@ -437,7 +463,7 @@ static int __init hp_wmi_bios_2009_later(void)
 {
 =09u8 state[128];
 =09int ret =3D hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &sta=
te,
-=09=09=09=09       sizeof(state), sizeof(state));
+=09=09=09=09       0, sizeof(state));
 =09if (!ret)
 =09=09return 1;
=20
@@ -472,25 +498,37 @@ static const struct rfkill_ops hp_wmi_rfkill_ops =3D =
{
 static bool hp_wmi_get_sw_state(enum hp_wmi_radio r)
 {
 =09int mask =3D 0x200 << (r * 8);
+=09int ret=3D 0;
+=09int wireless =3D 0;
=20
-=09int wireless =3D hp_wmi_read_int(HPWMI_WIRELESS_QUERY);
+=09ret =3D hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_READ, &wireles=
s,
+=09=09=09=09   0, sizeof(wireless));
+
+=09if (ret < 0)
+=09  return -EINVAL;
=20
 =09/* TBD: Pass error */
 =09WARN_ONCE(wireless < 0, "error executing HPWMI_WIRELESS_QUERY");
=20
-=09return !(wireless & mask);
+=09return (wireless & mask);
 }
=20
 static bool hp_wmi_get_hw_state(enum hp_wmi_radio r)
 {
 =09int mask =3D 0x800 << (r * 8);
+=09int ret=3D 0;
+=09int wireless =3D 0;
+
+=09ret =3D hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_READ, &wireles=
s,
+=09=09=09=09   0, sizeof(wireless));
=20
-=09int wireless =3D hp_wmi_read_int(HPWMI_WIRELESS_QUERY);
+=09if (ret < 0)
+=09  return -EINVAL;
=20
 =09/* TBD: Pass error */
 =09WARN_ONCE(wireless < 0, "error executing HPWMI_WIRELESS_QUERY");
=20
-=09return !(wireless & mask);
+=09return (wireless & mask);
 }
=20
 static int hp_wmi_rfkill2_set_block(void *data, bool blocked)
@@ -515,7 +553,7 @@ static int hp_wmi_rfkill2_refresh(void)
 =09int err, i;
=20
 =09err =3D hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-=09=09=09=09   sizeof(state), sizeof(state));
+=09=09=09=09   0, sizeof(state));
 =09if (err)
 =09=09return err;
=20
@@ -781,18 +819,16 @@ static int __init hp_wmi_input_setup(void)
=20
 =09/* Dock */
 =09val =3D hp_wmi_hw_state(HPWMI_DOCK_MASK);
-=09if (!(val < 0)) {
+=09if (val > 0) {
 =09=09__set_bit(SW_DOCK, hp_wmi_input_dev->swbit);
 =09=09input_report_switch(hp_wmi_input_dev, SW_DOCK, val);
 =09}
=20
 =09/* Tablet mode */
-=09if (enable_tablet_mode_sw > 0) {
-=09=09val =3D hp_wmi_hw_state(HPWMI_TABLET_MASK);
-=09=09if (val >=3D 0) {
-=09=09=09__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
+=09val =3D hp_wmi_hw_state(HPWMI_TABLET_MASK);
+=09if (val > 0) {
+=09=09__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
 =09=09=09input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
-=09=09}
 =09}
=20
 =09err =3D sparse_keymap_setup(hp_wmi_input_dev, hp_wmi_keymap, NULL);
@@ -919,7 +955,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_=
device *device)
 =09int err, i;
=20
 =09err =3D hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-=09=09=09=09   sizeof(state), sizeof(state));
+=09=09=09=09   0, sizeof(state));
 =09if (err)
 =09=09return err < 0 ? err : -EINVAL;
=20
--=20
2.25.1

