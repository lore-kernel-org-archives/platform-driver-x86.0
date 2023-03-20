Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2087DC6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 00:52:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjCTAwr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 19 Mar 2023 20:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjCTAwq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 Mar 2023 20:52:46 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2319B18B1A
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Mar 2023 17:52:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlItvyuATdmBD75ljl8tcJ3Pc/YGTW8HHs45R7Nh15GwZZXSOrB1LoYRPXhyUHZt71yqnQRfmMVVRkUWwp+AgibEKR+YP0C1zqxzUxaOuHMdhXTHuQB518SCKx7TnEQYTahxVnPan4TZY7fHyLtnF92wrrfHCiI+ysGSF67oHGTzkovBNKOPM8DV88yQjKUAQGA9jeFuCyeQ2hkCszq1svX/U0Yj+EMQdJ00Y7oHcDDkSz0LPqC7Kcoifq8Py/WFRwqZHdDRaG+MusthhBrQZpKqzSStGxF7CwP0pUhfp0RajF5TA0xIrbdrbwbE7VvBQ3tt2N3GWAQEJeDO6t8e4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDLfLAGwf/Q91/OqGyimu+ujglgCiVMeptJmI5MEP50=;
 b=h4kyzH44NnUNJaGYHIxO9gBdT/bB6lM48dFXlUYmv8E9hDc7wQPL55fYQUT/2wFtH32e8x52gKqyvdgcSQjkzNI/qndkz3ms6lCBVIPqxVPmzwS2W4tMHV/aomSlcvV9quCtexEY5epXpo7v5/TCQB0JeM5EsFie4QB7iaeQTvRBa/6SFKCiWGxDtIV1lC6HO/Mm9SvQZn/KfBSUzbrmguhL0HEZua8qAubNPd6NbED3ov+GRnv6PFYdDCDk7qo6nkpYAdGIg1ZreBjVHJ930EcZe84knHWQSgJralQrsyNDuRppSEj9H1EfLFszDCGpiO1fsd03FTxn2eXHIlKJHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDLfLAGwf/Q91/OqGyimu+ujglgCiVMeptJmI5MEP50=;
 b=4U09xHHlS3fwdu4v34hKysP41lucp6E4YeG0PBZf+p9Q1ZECqmr9MTS3m0ORHMrpAa05ViBQjQI6AA9R9Q4i5s9iwD5As1zkvxRnpxNy4k93Mo+P/FTGck4Y+L5XOk458k6uj0J/qOBY+fmQ4m8nOjfn+854n+V+ihxVkCm1j4w=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB7648.namprd12.prod.outlook.com (2603:10b6:8:104::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 00:52:41 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614%9]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 00:52:41 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
CC:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "markpearson@lenovo.com" <markpearson@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v3 1/3] platform/x86: think-lmi: add missing type
 attribute
Thread-Topic: [PATCH v3 1/3] platform/x86: think-lmi: add missing type
 attribute
Thread-Index: AQHZWOe5AypkZvC0wEyUBganNBn+ca8C2qkA
Date:   Mon, 20 Mar 2023 00:52:41 +0000
Message-ID: <MN0PR12MB610121806C034097EE4C570EE2809@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <mpearson-lenovo@squebb.ca>
 <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
In-Reply-To: <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-03-20T00:52:55Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=df01b034-c04f-4697-ae07-e9526d707f44;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-03-20T00:52:55Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: c0614a8e-9680-4006-8117-a2df7ab3f3ce
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|DM4PR12MB7648:EE_
x-ms-office365-filtering-correlation-id: 2c71a066-c150-4542-cbaf-08db28dd68dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YDgw36Z7sHAeazw0oOskhrkmrjZUSaoF0Triu0QkLZKVv0Jgy8+/4abCK4x2pSOl4G2GMvkVPa+NIoNlVl6M1UYU2zEuNyfXMpsXBe6VYQf8lvDpGPTNXnomGDgwkHYRH1eWSeyWpzzGpaTvVn9xIJa6YqUtxJkab6MJ1H+6ZdLSwDxivyGLZ6FMFj18FCJ/VoMTMZtS7Uf6gGzibYfb/VVzycDJ1RnQ3qaaMn31J6lYqbH69NSgT5DH4L6/Kpf2VTs4vfKuctJThRYhAwjvjFV6mT5nFnNEGwWekGmwy7+EACCK0JSFou7EIo0+BB9vYKZIVsv6CR3TSwu8EYFY3Z6qonXi6A7bSkjvg1HjUzD70uXdGgmQPqtLa9AwZNz6Joe5gMOvMJFgXQGRHsoPZlDNL/aP1FwqvRLXNSeYhGNzXQMwDNPPqDPB8Gil5bEPQXpPpyPq7bqrQybAWAcTe4poyKStMUZ66ejb6idFIjIZxYyzHMIW1ly9haeeZzZ1sSgUj4yP692b4/W9vMUvU8RyyTgKlCu0FT3VGnjgX7BQQZdjRVQmcGrSvFQz2z+Tnq+MsNcT4SLXyL5i7gpihKp5i6xlX+avoYbhmKlY28mgXumFhcKpSQj+NFST+kuRbB7XP+JViBLCBRdFOXgIM6ZHlgQOzMQJYaBNfTytjmWF49G5nV0v4Lvztcw7s3oB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199018)(86362001)(55016003)(33656002)(7696005)(71200400001)(83380400001)(64756008)(8676002)(316002)(4326008)(6916009)(66556008)(66946007)(76116006)(478600001)(66446008)(54906003)(66476007)(186003)(9686003)(6506007)(53546011)(966005)(38100700002)(38070700005)(52536014)(5660300002)(8936002)(41300700001)(2906002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cBFbUjhfp7lBcFb9OR+FXwN2X0IV0FLrMYDRlmzNAZTZsHoYBFOHNhY35TW3?=
 =?us-ascii?Q?lo4nCTiI5lWkUhYd2Ix/6TKvJvGjFJx65tcSb2xszeklo7TIyw8K064Erjqq?=
 =?us-ascii?Q?29U4xBjbSxWKYwp9RpKy4ewRRErEI+FnkgIIUBLuP2FfhnO6p8vqihGq2fSD?=
 =?us-ascii?Q?wP7szZyihUhNltGjWRLMPFhp6rxNqE5wyWNoOFwiZ7H5IxLalpjjRBqDv/m4?=
 =?us-ascii?Q?Bonr5zrZoo0kvBIpd7y6tcbJmOO8goF0XH/mUJ2e8ApwkBZfUOXz5zGm5EOv?=
 =?us-ascii?Q?kxPxjTxeQeA5ENbHnD2bFpf3UCmjwnKFgwTCx2WHaRRnBx5qsWDHDEFI0an6?=
 =?us-ascii?Q?xUnFtviIzXkmexd758QT36J+O0+YlzxnZL5vbwIyRQH9E7kAsmzi4jHEZFfa?=
 =?us-ascii?Q?4npHIQRziBqc3ZovMAn1lCx4xtXohLxg7kASUHYKGXfe2BYUrPdfd8kEz/ul?=
 =?us-ascii?Q?FUaeknfqFSNrZjRRpMsKPr4tqOexjk7OYQegXMmezQxXwenjGPTJwl3N59YR?=
 =?us-ascii?Q?EGX5eY8mFRUSpWC0KygYhr/BKfUKROjTYsMOGdVZVzmQVc00qFcgmKyR9mSf?=
 =?us-ascii?Q?MEbwwCm7+N5nsMg5kkJPOrsqNr7omO41p+YRO87jUFZhXbYjNwnFU/snLaUm?=
 =?us-ascii?Q?eiaGpoxpeGPo43DflYjKciF6d4aln+1l1PqLKwvZgfq4kX//JYxz4CraSNVb?=
 =?us-ascii?Q?J+xeFZMgdqe5he69VApflQmpMSQD5odyIXg0m9sxGqOtvpUCfKS7lDjzGv3C?=
 =?us-ascii?Q?pOvdbBTFEZmj4FtQGYWES8yA1uFFU0mmSpQe4ILbN3fUV+Y9Gz88/rsWzTWM?=
 =?us-ascii?Q?BSKOzI7z6VGvBe3DxVhNfxIsYzYfatBP2Efmcyiph52s/M6tO9qqlq1dGim/?=
 =?us-ascii?Q?yBO7JX/MrU5sb0OWC+9PyVmgoYUGbg7jkNrlkuwdavLIV4zfBkgwHRXnzJvo?=
 =?us-ascii?Q?jk05C22bXhSh7WASFcVlVei60AXLRc2w5aShomJ0hU5dQG6XC24rmJCTZhr9?=
 =?us-ascii?Q?efORdb/YYo7FWenQwao/ZRYO68ukSCAAghf/Fj1BSgV8GvRKo/xGfWkE705b?=
 =?us-ascii?Q?EznChfypxNC+eZTnkJOSkf4MGn5LQ2LoA3yzVRDF2kwawO/PI0lE1YA12tcL?=
 =?us-ascii?Q?h4Uie6rccU12V2pB2btUZs5JjOnxxoi3jlRnqCWiFN3cgd23QWtrdJ2316WZ?=
 =?us-ascii?Q?ipzuD/xVMCP2p9BgTKH7QjI/CfIUXbtGxJHPPhbfIdd6u/VtZb5wNWi0sRKT?=
 =?us-ascii?Q?jDpTe8w6dW0H/nP9b1pPab1ZKRciCrHZq+uhdwP/ZJBtcEp3umGjD3PrV+vn?=
 =?us-ascii?Q?734/2fROIF7kZeGrEW1mLvhcKUNATiOAFARC83X5ldmmAJG+H/4JdN2NeHpA?=
 =?us-ascii?Q?lexZwWsIK8Q3wrlJqGrvv4bEwtYJ3Um7YvwI+D1qe1dJAnMt1WIsYvljCEZg?=
 =?us-ascii?Q?X6J+ur1xH9/k+zjObToAdKDbM0t/muWH/RmoUalB44R9MNiAG2pxcfDXs0T7?=
 =?us-ascii?Q?xDuj1cfO80rEu2lTZUrZtTiDfCZIeuBZy9SnkLYO//stZUvRDOEXxLUDrx5L?=
 =?us-ascii?Q?YjauB1QCBr0eLnmFr1olxocm/tiJnxTzy8jzlnjbryDcS1hiYuADeLYcHc/+?=
 =?us-ascii?Q?atuFXQwbUOopNd4wSdHfKRk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c71a066-c150-4542-cbaf-08db28dd68dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2023 00:52:41.4838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ntxznExBg1ar72fnS7aw1FPDvgnmstmFGAAA/nPPKNcWkM/8r1DXhGml0EPOnfiCm9Gpe4xN14G/MSFmIYkHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7648
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[Public]



> -----Original Message-----
> From: Mark Pearson <mpearson-lenovo@squebb.ca>
> Sent: Friday, March 17, 2023 10:47
> To: mpearson-lenovo@squebb.ca
> Cc: hdegoede@redhat.com; markgross@kernel.org;
> markpearson@lenovo.com; platform-driver-x86@vger.kernel.org
> Subject: [PATCH v3 1/3] platform/x86: think-lmi: add missing type attribu=
te
>=20
> This driver was missing the mandatory type attribute...oops.
>=20
> Add it in along with logic to determine whether the attribute is an
> enumeration type or a string by parsing the possible_values attribute.
>=20
> Upstream bug https://bugzilla.kernel.org/show_bug.cgi?id=3D216460'

The tag you should use here is "Link".
IOW:

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D216460

>=20
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
> Changes in v3:
>  - Rebased on latest pdx86, review_hans branch
> Changes in v2:
>  - Simplify the code and move type determination into show function
>  - Don't use Fixes with URL in commit info
>=20
>  drivers/platform/x86/think-lmi.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/thin=
k-
> lmi.c
> index 86b33b74519b..5fa5451c4802 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -947,6 +947,20 @@ static ssize_t possible_values_show(struct kobject
> *kobj, struct kobj_attribute
>  	return sysfs_emit(buf, "%s\n", setting->possible_values);
>  }
>=20
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *at=
tr,
> +		char *buf)
> +{
> +	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj);
> +
> +	if (setting->possible_values) {
> +		/* Figure out what setting type is as BIOS does not return this
> */
> +		if (strchr(setting->possible_values, ','))
> +			return sysfs_emit(buf, "enumeration\n");
> +	}
> +	/* Anything else is going to be a string */
> +	return sysfs_emit(buf, "string\n");
> +}
> +
>  static ssize_t current_value_store(struct kobject *kobj,
>  		struct kobj_attribute *attr,
>  		const char *buf, size_t count)
> @@ -1036,10 +1050,13 @@ static struct kobj_attribute attr_possible_values
> =3D __ATTR_RO(possible_values);
>=20
>  static struct kobj_attribute attr_current_val =3D
> __ATTR_RW_MODE(current_value, 0600);
>=20
> +static struct kobj_attribute attr_type =3D __ATTR_RO(type);
> +
>  static struct attribute *tlmi_attrs[] =3D {
>  	&attr_displ_name.attr,
>  	&attr_current_val.attr,
>  	&attr_possible_values.attr,
> +	&attr_type.attr,
>  	NULL
>  };
>=20
> --
> 2.39.2
