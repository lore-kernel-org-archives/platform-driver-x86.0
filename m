Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazon11022085.outbound.protection.outlook.com [40.107.161.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EF042E8DC
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 18:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.161.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101818; cv=fail; b=qEZAJ/IKQjAW33jM5CpKgfIZ/JUkS153NCE/PCj/nBx0Y/7KM7JaF3LcoG9OmHx+B5baYfnAMEtSMMPRNNzh0Q7V5ct8DNRlTTvQis+Jc5otwWqpNul8MhbyIgexzXSHELtUA8WEq1uOAOMrUk6Knd81lFiijvWv41vtP9N3JSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101818; c=relaxed/simple;
	bh=qKXXuMZsVFxS0Uh7ZMXJD4BURfSQ10ibu+L1zhXMZC4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MpeHw86PWNw/PgtsqXGgvKDvhtUWEfYOpaTl5AtNfKqc1vohPGeNOG1+CK8FERLGEiSaT75YNS72pLQogxt8SolaRVImDb0SBeUVWTsZ37oIGN9IVVU89WeW4RA1FThMtGM9YxPAGs2jf/9EZJMnfxZVf5UbJvkmGqUFjNi3HMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alantys.it.com; spf=pass smtp.mailfrom=alantys.it.com; dkim=pass (2048-bit key) header.d=alantys.it.com header.i=@alantys.it.com header.b=GUuQY8o4; arc=fail smtp.client-ip=40.107.161.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alantys.it.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alantys.it.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alantys.it.com header.i=@alantys.it.com header.b="GUuQY8o4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmjMxb1oD22TlQDgrUES3Bw7PXOPBc00uHq1PE45ooI6utlSddK0AKjECv7ek5LLoBk/Bb1DRoACjmrrvoWmL4zn/ZMrozzaA/UBgbIMe7ZeF5DUDKW+I70s3ElGTog+z1xLb4X/XNbjPNl22yjrhHNJ117O20VxsltzSPqxV/wWPpGKP0pUv7XvTRAiNzLZ1vB0xpMrFc9Ild8pWroe/RtWRIgEyYDeBYAiLSeeNpba9jQBlFMyH3FSSG1k3cmJ3bmV/NWaZHwQb/QlWMSaCHLxHJPJQNCo4XRxqyYH6tIvlTL+F5lgGmWpiUDTHZwtGdr7mg+jRDccnCgfqKofgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8SSdSaA1NDibyKibc1SjaEil19snjZ/lK2AXuOUeBQ=;
 b=nlh3yyDZlZmJsdt0X7ugsGNIVrQ7EjZNixWzq5w6vMhnY2pVumutxQjJd1YezcYjByqFG/2j/9RQGrXYnV2QSHyGBDs2ENryONohtD+kKHB7RMB5e2uMr2WVcA1lyrlfvI+UdyxMmhaaWGTgheVKAYrZWFo0evudtjDnNx9SMk919aeAE5+9ka/dGxgHTinT+16lExgPOLKJr29CGdrjv2y3vcif/TrS8W43bZe9y8n1gduLizzFQCe17D3HX6BMFs3+XnO1E0QZ4s2HqlgV2T5tPzp8tzromaSmDPo0NWRfdB6TO9GY6ZfnDoViwm0QlQSAA/Xf7AOtLIKdVmdsqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=alantys.it.com; dmarc=pass action=none
 header.from=alantys.it.com; dkim=pass header.d=alantys.it.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alantys.it.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8SSdSaA1NDibyKibc1SjaEil19snjZ/lK2AXuOUeBQ=;
 b=GUuQY8o4EaSpgVIsgH8mHjkRP7uaVZwG8KWm55o01xv5YYTkOblOr3sx3vhBnOTfv7ClhFPfaPt6v2qrv/75EPmD1mjpucs8xGbuZ7AAgil+0fcsIrKNorZUmJYguLhyZmjbV+rKKurscLW57MTmxWrxaxYhjZ9AFS2bg56SRtsCwExBs1UXrN2Mubulup8WR/x0HC7qKHl1x9BPRrU66YVpH/qaf1wPUkK8tYf8cVhB+l4DN9d1wlWAIieTThK4QzGaViSq4j7FoF/pYi3KNaLHcZ4XTZSMtt4HunyBzb6/COZaMZCHfm9E8xM2T51ufpfPgVtSG+BOZCtWPaJn5Q==
Received: from MRYP264MB6446.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:6b::5) by
 PAZP264MB3246.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e4::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.14; Tue, 22 Sep 2026 18:30:09 +0000
Received: from MRYP264MB6446.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9b20:58a:79d1:4299]) by MRYP264MB6446.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9b20:58a:79d1:4299%5]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 18:30:09 +0000
From: "Luciana  Kreutz" <Lucianakreutz@alantys.it.com>
To: "draft-ietf-spring-segment-routing-policy@ietf.org"
	<draft-ietf-spring-segment-routing-policy@ietf.org>, "msiva@cisco.com"
	<msiva@cisco.com>, "zali@cisco.com" <zali@cisco.com>, "jliste@cisco.com"
	<jliste@cisco.com>, "fclad@cisco.com" <fclad@cisco.com>, "skraza@cisco.com"
	<skraza@cisco.com>, "mkoldych@cisco.com" <mkoldych@cisco.com>,
	"shraddha@juniper.net" <shraddha@juniper.net>, "stevenlin@google.com"
	<stevenlin@google.com>, "pkrol@google.com" <pkrol@google.com>,
	"martin.horneffer@telekom.de" <martin.horneffer@telekom.de>,
	"dws@steinbergnet.net" <dws@steinbergnet.net>, "bruno.decraene@orange.com"
	<bruno.decraene@orange.com>, "stephane.litkowski@orange.com"
	<stephane.litkowski@orange.com>, "luay.jalil@verizon.com"
	<luay.jalil@verizon.com>, "daniel.voyer@bell.ca" <daniel.voyer@bell.ca>,
	"pamattes@microsoft.com" <pamattes@microsoft.com>, "1554241055@qq.com"
	<1554241055@qq.com>, "498584170@qq.com" <498584170@qq.com>,
	"magle@wekorm.com" <magle@wekorm.com>, "info@handelsen.cn"
	<info@handelsen.cn>, "k5n746m97f@virtual-author.com"
	<k5n746m97f@virtual-author.com>, "msc@msckobe.com" <msc@msckobe.com>,
	"sgm.cpc@optcl.co.in" <sgm.cpc@optcl.co.in>, "wb@silkroad24.com"
	<wb@silkroad24.com>, "873582202@qq.com" <873582202@qq.com>, "ybzhan@qq.com"
	<ybzhan@qq.com>, "info@stctri.com" <info@stctri.com>,
	"5kgi69kq8g@virtual-author.com" <5kgi69kq8g@virtual-author.com>,
	"sales@nanografi.com" <sales@nanografi.com>, "info@nanografi.com"
	<info@nanografi.com>, "sales@aikelabs.com" <sales@aikelabs.com>,
	"zhongxl@icdeal.com.cn" <zhongxl@icdeal.com.cn>, "sales@icdeal.com.cn"
	<sales@icdeal.com.cn>,
	"bac.bureaudeservicegiti-imitservicedesk.lac@canada.ca"
	<bac.bureaudeservicegiti-imitservicedesk.lac@canada.ca>, "info@yzpst.com"
	<info@yzpst.com>, "liu45952008@163.com" <liu45952008@163.com>,
	"service@nukuso.com" <service@nukuso.com>, "hyjdzzx@aliyun.com"
	<hyjdzzx@aliyun.com>, "email-244673889@qq.com" <email-244673889@qq.com>,
	"244673889@qq.com" <244673889@qq.com>, "email-szyctdz@163.com"
	<email-szyctdz@163.com>, "szyctdz@163.com" <szyctdz@163.com>,
	"email-leo@wansan.net.cn" <email-leo@wansan.net.cn>, "leo@wansan.net.cn"
	<leo@wansan.net.cn>, "email-hu970387450@126.com" <email-hu970387450@126.com>,
	"hu970387450@126.com" <hu970387450@126.com>, "email-420014373@qq.com"
	<email-420014373@qq.com>, "420014373@qq.com" <420014373@qq.com>,
	"email-2573292269@qq.com" <email-2573292269@qq.com>, "2573292269@qq.com"
	<2573292269@qq.com>, "sales1@xrjdcs.com" <sales1@xrjdcs.com>,
	"3005391986@qq.com" <3005391986@qq.com>, "sales7@saulplc.com"
	<sales7@saulplc.com>, "liyouxingdz@qq.com" <liyouxingdz@qq.com>,
	"kefu@360.cn" <kefu@360.cn>, "360baike@360.cn" <360baike@360.cn>,
	"info@ecolocityled.com" <info@ecolocityled.com>,
	"support@braintreepayments.com" <support@braintreepayments.com>,
	"info@huntron.com" <info@huntron.com>, "info@ethernet.edu.et"
	<info@ethernet.edu.et>, "j@ring.com" <j@ring.com>, "yul@ring.com"
	<yul@ring.com>, "ganswijk@xs4all.nl" <ganswijk@xs4all.nl>,
	"chipdir@xs4all.nl" <chipdir@xs4all.nl>, "sales@anwayelec.com"
	<sales@anwayelec.com>, "fam26@drexel.edu" <fam26@drexel.edu>,
	"info@tempco.com" <info@tempco.com>, "service@droking.com"
	<service@droking.com>, "gdedwards23@gmail.com" <gdedwards23@gmail.com>,
	"muriel@speedelec.fr" <muriel@speedelec.fr>, "fsimmons1946@gmail.com"
	<fsimmons1946@gmail.com>, "service@drokiing.com" <service@drokiing.com>,
	"jglandi@aol.com" <jglandi@aol.com>, "skubon@icloud.com" <skubon@icloud.com>,
	"steve_wollenbeg@yahoo.com" <steve_wollenbeg@yahoo.com>,
	"you.trbolf@yahoo.com" <you.trbolf@yahoo.com>, "obhandakkar9876@gmail.com"
	<obhandakkar9876@gmail.com>, "acampbell@tristardes.com"
	<acampbell@tristardes.com>, "tlchatmandesigns@yahoo.com"
	<tlchatmandesigns@yahoo.com>, "longqipro@foxmail.com"
	<longqipro@foxmail.com>, "rtrisk@gmail.com" <rtrisk@gmail.com>,
	"darylp33@gmail.com" <darylp33@gmail.com>, "d.mascherin@rogers.com"
	<d.mascherin@rogers.com>, "jeff50mil@gmail.com" <jeff50mil@gmail.com>,
	"jorgenf@amazon.com" <jorgenf@amazon.com>, "sssavage@amazon.com"
	<sssavage@amazon.com>, "echo198711@gmail.com" <echo198711@gmail.com>,
	"ralphl@arsnovainc.com" <ralphl@arsnovainc.com>, "calhounsof@hotmail.com"
	<calhounsof@hotmail.com>, "baker.robertg@gmail.com"
	<baker.robertg@gmail.com>, "sales710@batteriesplus.com"
	<sales710@batteriesplus.com>, "daphne.yuen@microchip.com"
	<daphne.yuen@microchip.com>, "xjjkary1989@126.com" <xjjkary1989@126.com>,
	"icelike@sjtu.edu.cn" <icelike@sjtu.edu.cn>, "boemwebteam@boem.gov"
	<boemwebteam@boem.gov>, "bobo@clx-tech.com" <bobo@clx-tech.com>,
	"info@vectorcontrols.com" <info@vectorcontrols.com>, "info@eltim.eu"
	<info@eltim.eu>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "git@segbrk.com" <git@segbrk.com>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
	"qipeng.zha@intel.com" <qipeng.zha@intel.com>, "y.linux@paritcher.com"
	<y.linux@paritcher.com>, "pali@kernel.org" <pali@kernel.org>,
	"mario.limonciello@dell.com" <mario.limonciello@dell.com>,
	"rublag-ns@yandex.ru" <rublag-ns@yandex.ru>,
	"sathyanarayana.nujella@intel.com" <sathyanarayana.nujella@intel.com>,
	"jairaj.arava@intel.com" <jairaj.arava@intel.com>, "david.e.box@intel.com"
	<david.e.box@intel.com>, "gaurav1086@gmail.com" <gaurav1086@gmail.com>,
	"luwei32@huawei.com" <luwei32@huawei.com>, "hulkci@huawei.com"
	<hulkci@huawei.com>, "zappel@retarded.farm" <zappel@retarded.farm>,
	"markpearson@lenovo.com" <markpearson@lenovo.com>, "njoshi1@lenovo.com"
	<njoshi1@lenovo.com>, "slacshiminar@lenovo.com" <slacshiminar@lenovo.com>,
	"bnocera@redhat.com" <bnocera@redhat.com>, "aaron.ma@canonical.com"
	<aaron.ma@canonical.com>, "grandmaster@al2klimov.de"
	<grandmaster@al2klimov.de>, "vadimp@mellanox.com" <vadimp@mellanox.com>,
	"fe@dev.tdt.de" <fe@dev.tdt.de>, "rdunlap@infradead.org"
	<rdunlap@infradead.org>, "dvhart@infradead.org" <dvhart@infradead.org>,
	"andy@infradead.org" <andy@infradead.org>, "linux@weissschuh.net"
	<linux@weissschuh.net>, "pobrn@protonmail.com" <pobrn@protonmail.com>,
	"weiyongjun1@huawei.com" <weiyongjun1@huawei.com>, "sales@myirtech.com"
	<sales@myirtech.com>, "myirtech@gmail.com" <myirtech@gmail.com>,
	"sales@myir.cn" <sales@myir.cn>, "support@myirtech.com"
	<support@myirtech.com>, "support@myir.cn" <support@myir.cn>,
	"df.zhong@vnmod.com.cn" <df.zhong@vnmod.com.cn>,
	"vicorquality@vicorpower.com" <vicorquality@vicorpower.com>,
	"support@suretyhome.com" <support@suretyhome.com>,
	"customerservice@suretyhome.com" <customerservice@suretyhome.com>,
	"crystal@swanautomation.com" <crystal@swanautomation.com>, "info@nvidia.com"
	<info@nvidia.com>, "privacy@nvidia.com" <privacy@nvidia.com>,
	"support@abrites.com" <support@abrites.com>, "sales@abrites.com"
	<sales@abrites.com>, "university_china@lm.renesas.com"
	<university_china@lm.renesas.com>, "jos@semi.ac.cn" <jos@semi.ac.cn>,
	"info@rightleds.com" <info@rightleds.com>, "solutions@pi-team.co.uk"
	<solutions@pi-team.co.uk>, "enquiries@pisales.co.uk"
	<enquiries@pisales.co.uk>, "support@parallax.com" <support@parallax.com>,
	"cyphunk@gmail.com" <cyphunk@gmail.com>, "marketing@tuya.com"
	<marketing@tuya.com>, "vip@tuya.com" <vip@tuya.com>, "service@tuya.com"
	<service@tuya.com>, "pr@tuya.com" <pr@tuya.com>, "scott@hanselman.com"
	<scott@hanselman.com>, "editors@cnet.com" <editors@cnet.com>,
	"nicklewis@howtogeek.com" <nicklewis@howtogeek.com>,
	"editorial@howtogeek.com" <editorial@howtogeek.com>,
	"antara.b@analyticsinsight.net" <antara.b@analyticsinsight.net>,
	"sankha@analyticsinsight.net" <sankha@analyticsinsight.net>,
	"sales@totalphase.com" <sales@totalphase.com>, "contact@husarion.com"
	<contact@husarion.com>, "support@husarion.com" <support@husarion.com>,
	"peter@firstfives.org" <peter@firstfives.org>, "ask@ecer.com" <ask@ecer.com>,
	"tayeb.habib@gmail.com" <tayeb.habib@gmail.com>, "benryves@benryves.com"
	<benryves@benryves.com>, "sales@huayanelec.com" <sales@huayanelec.com>,
	"elaine@huayanelec.com" <elaine@huayanelec.com>, "htmsb@hydrotrent.com"
	<htmsb@hydrotrent.com>, "khoo.sk@hydrotrent.com" <khoo.sk@hydrotrent.com>,
	"info@thinksrs.com" <info@thinksrs.com>, "oracle-acct_ww@oracle.com"
	<oracle-acct_ww@oracle.com>, "no-reply@identity.oci.oraclecloud.com"
	<no-reply@identity.oci.oraclecloud.com>, "info.peak@hms-networks.com"
	<info.peak@hms-networks.com>, "support.peak@hms-networks.com"
	<support.peak@hms-networks.com>, "contact@eapfoundation.com"
	<contact@eapfoundation.com>, "gb@gb.gb" <gb@gb.gb>,
	"asxvmprobertest@gmail.com" <asxvmprobertest@gmail.com>,
	"smart.journey.prober@gmail.com" <smart.journey.prober@gmail.com>, "1@8em.ma"
	<1@8em.ma>, "ppduwrcuq@btvpv.se" <ppduwrcuq@btvpv.se>, "257qi7@irtrrbsy.ac"
	<257qi7@irtrrbsy.ac>, "sales@london-electronics.com"
	<sales@london-electronics.com>, "accounts@london-electronics.com"
	<accounts@london-electronics.com>, "walter@sky-brokers.com"
	<walter@sky-brokers.com>, "info@sky-brokers.com" <info@sky-brokers.com>
Subject: OEM Electronic Parts Available for Current Requirements
Thread-Topic: OEM Electronic Parts Available for Current Requirements
Thread-Index: AQHdSrtlowDmD1/nWkC1EeExZKjN0w==
Date: Tue, 22 Sep 2026 18:30:00 +0000
Message-ID:
 <MRYP264MB6446141EA668A83766FD959380832@MRYP264MB6446.FRAP264.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=alantys.it.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRYP264MB6446:EE_|PAZP264MB3246:EE_
x-ms-office365-filtering-correlation-id: f90be35c-33fd-4298-8133-08df18d78831
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|6049299003|7416014|376014|23010399003|34096008|586017|1800799024|4053099003|38070700021|921020|7055299009|10067099003|6123799006|56012099006|8096899003|18002099003;
x-microsoft-antispam-message-info:
 VRtXkFLPfnewmfHz5EoU5hp+4oaILUedKyjottbWxrF/tRAoqvKnYAlaBO05NpNVrED13fSPhrm1reAvA6ypwEx1sYOVawGWfA/o9X0vCgKuz8pKbSKqRLZ1cLcuc+3P4wr8TS/xmMYvHNLBlakDy9abjAexsT3Cn4AdtCzC4mTMiCwrrYo38c0x4cWYwoDxkIAvjDwaY9PguS6qNo/lDzT6EE8Y1NXwO1c5jSZjFOxsjBfajPdxpzdNqfxmz70+Grhj7wbU3NTVTHyhACCFAL/+l1WhtA2Y1zLNTgKwrOzlHAzSNzagIirxVePOcw3TfWt1EaVScqK3KhC2LMCo41F83WhXhGLUVzXgOnckeqlM8c8LKD+MmsMdgMSWpSQ0OUxOsh61ZAw+hjH35yDKy94zoVoPr87ncJ5Q7t79CF1/k2twFp5LhZQLQ8VCinSNqPHIhFZzvm/OfWenFRIICxjgnqpv/lfWJn23vfWutGS73cOg77AYvibbJOQ7s+QEIgLC6ylWNtqgvJjhDW6hgiG1uVOA2NkgFlV7dM56TpiiWZLPh410gu4D3nqs/kJWCMZmLrQCj48SkXhVY3IclBHGPtizqrV3ADi/8wWsd+dyZaDJc5NWr6e41l9/5jKrgidoTaKDd0zsOdKc4Hkwn66WBgzpZCkqU+6dDmbHrn8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRYP264MB6446.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(6049299003)(7416014)(376014)(23010399003)(34096008)(586017)(1800799024)(4053099003)(38070700021)(921020)(7055299009)(10067099003)(6123799006)(56012099006)(8096899003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RUF6M0xXWGppRTZUUURHTURtNElYeGlTcmNWbFZXdXpJbjRmK2tBTURyQXps?=
 =?utf-8?B?c29PNWEzS3BFc2tpVW5VUDN5dlk3ZTFFWmQxVXEyUGR6TVZ0c2ExTjd5RHUr?=
 =?utf-8?B?SzBlYlQ4Ym5lVytyUVhod21FNjZOdFZmU1MybTYzanFWS0RMQyt6dUc5Mi9u?=
 =?utf-8?B?VVR3L1hYVlJaRklOZ0VCZ0lJM3A3SStMQ01DcDNlcGdVSkdxZzZRaVl3dldn?=
 =?utf-8?B?cDBRWTh2V0xmV2Q0bkdYRUUza3BEbFpta1p2cXh0VEpCZkhQYzl5YXBwTnJ2?=
 =?utf-8?B?Ty8wVFhIQTVrVDBtUkJTT2NRWGV6Ri9TMnBWdXVUeGZxbXIwV3h3UUl0RlEr?=
 =?utf-8?B?ZFVSTVoyV2p3bVN1N0t1U1lWeUV3SG5vWWpscG0xWnJBTUVrc1lGbzdLOTVk?=
 =?utf-8?B?TmdBNCsyeGxKWkYrYk1DOXhoZ3lpR3RFMXBkdzlxV3N0RGgxNnZTVkUrUTJn?=
 =?utf-8?B?aGhIZkFRRHQrSWVQckFVakpwUGtJZU9IQklEUEtieW45bG1yVU0vNlVDaHRF?=
 =?utf-8?B?SnZTNXozaG9ZZmNudi9tb3IrWWZheWIyREpLSE9UOWFIM1ovdW9UUEJnWlYv?=
 =?utf-8?B?WHpxbjQwTW43aTJVQkFTcU5SL2JIOUVEWEpjNHZrVmNTdC81cysvREtMZ2Rr?=
 =?utf-8?B?U0U0OVluNnRmKytiTDAvbnhFVk1lVGlpdjZnYTdQTG9SUWxFWkRiSHYzM05M?=
 =?utf-8?B?ZGN4L1RYeFdmOW1vNThXQkZ3eFdwUmk0a1d0TlU3K3VFdDh3aGpIT25nMmo0?=
 =?utf-8?B?ZkZBTE1tb0l1VE80cFNYa0I1SjhTbExZYWZmWHJlRStnQTlZMjNWNFcxZDVp?=
 =?utf-8?B?M0dwaElWVGdWalRYemhYT0NHYzR1aFpnMzFJSEFuUkNHT1A4RG5ua21PdE9m?=
 =?utf-8?B?bVVqWWFkQTVaRVNoNWxQK1ZFYUVyTkxYQ0dhOHkyZjBtWlpJcERuTkNKT2FE?=
 =?utf-8?B?bHRPNkRGQ1E0TVp4QUhpdDRHYkcrb0dGMW9oMythMnQwY2xGa0d0Vm8wRVdV?=
 =?utf-8?B?bWhidy85Sm1KdVg2dGRISkJETVg1c2w5d1JORGtYbVM5N216dG9oUUphdU12?=
 =?utf-8?B?bEFNN0Q2Umk3cTdqSkhpK3VWY1N3SDZGSWg2ZHJuVmZaVFQrMk9QaUVWL2Y3?=
 =?utf-8?B?K0RkcHl6WnlORkdsQ2JMcUJ2OStwZ0FLMWthRU1GTEgvNDBOOUhCNWV2cGtR?=
 =?utf-8?B?RmZTU09MdjlrSUdTN0MyR04vV3JnVGVEZ0VZL3c5NE16L043MTFUUDJTc291?=
 =?utf-8?B?aGt2eTdmSThJaWNDd0M0bjJ1akJvdnd0cFJ0aWlKOEliRmpXMmxwc0NzVlow?=
 =?utf-8?B?VVo4T1BLSWZYcE5BL1R0TUpXSGU3N0NvTllkeEtNOWUxMVRFdkw1anFJeUFO?=
 =?utf-8?B?bWlYdnZUbnFYSXhmNEo4NmJxeitsWFJZK0dpSlhLbHJQZ3g3SDVTekR5KzR5?=
 =?utf-8?B?eUVKUzBOL3dnOXBSRFdpWWl0SFRpaE03NlBDeWEyV1ZwNVZZc1ZmTXRKaUZ4?=
 =?utf-8?B?WmV4eXlzT2FjMVVabVhOckszNWFjQUNReEVqYUNFeVdqRjdGd1NUR2RlM2F1?=
 =?utf-8?B?UTgxNVZlQ1F3VjFlR3M1WGc0ZnlLWmU1anFDRnR2bS9vQ1p4OHM2V2Zqbkcx?=
 =?utf-8?B?eENHanNrSmZGcGZHNUErcTZGWmZMVGFYd1ZlQkFZVDRUak9uaHdtZ3FtMnVz?=
 =?utf-8?B?SG5xWHBCMitDN0RQNjcrZlJUTnNVQVJXdjUxRVo0eHcrVUpVS2g4OEdWdHRx?=
 =?utf-8?B?a05TU09ZK0dIblArMTdLcWYwV25IMzE2c0RzNzFzMTN4TUlqNkljTHhsd0cr?=
 =?utf-8?B?WE9UbmZNNWg3VlUyU2g1NlE5WHgwN3pIZlRucW1xdW9YMmpoQUs0QjdFeit0?=
 =?utf-8?B?MUJKNSszWGZiOW1aaEh6UGEzSUc4VWhTRFN1TUFTUFRXT3ExQXdxNU1Qbncy?=
 =?utf-8?B?VjZiZTU2K3ZyMDNEZnpPTS93N25lbmg2T1BTRjY4OFV2VVo1Vlczcm1aSFRR?=
 =?utf-8?B?Rm5QeDd4bmErOEllQzMxZ3ZidmNhaTF5WmE4RGc0anVoRUVGTlpyNW5JQW0y?=
 =?utf-8?B?dXBEemRFR0p2RG02dHczUjlmdGl0STRFVFgybWdOK0FFREQ1c0xGR2pJMC9n?=
 =?utf-8?B?OTAvZlFITHBONDlpMHM1bjNPY1pya2RVUWc1ZlptV0RPYStGYXRtd0xldEdJ?=
 =?utf-8?B?YmpHcG9lUFZNSzZZQW5xa1pTNE9scmxWeFdsb0pIVVhEM25SMHZhOFFGSG5v?=
 =?utf-8?B?ZTFkeFVlVTI1VmE5b1piTTV4OG4wY05Dem0zeFhOZTZEa3R5R1h0enRsQTVH?=
 =?utf-8?B?eXVkRk5WMlcyMXpGc1QyNjJmK0VHcm5kSWJXYmhkOURQdDFveXdUUT09?=
Content-Type: multipart/mixed;
	boundary="_006_MRYP264MB6446141EA668A83766FD959380832MRYP264MB6446FRAP_"
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: alantys.it.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRYP264MB6446.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f90be35c-33fd-4298-8133-08df18d78831
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 18:30:09.1433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: aa9126be-9035-440f-a2d3-ccd39d98577d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: POTgajtqnB58zuevTOOcE90dn4VGp3eiRwUCtjpt2FthRTK0DJte8yZoJorymsL4gGycsjTqBsnhJzcOkA2IPSY34oYdwceIjJKDRYiKZgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3246

--_006_MRYP264MB6446141EA668A83766FD959380832MRYP264MB6446FRAP_
Content-Type: multipart/related;
	boundary="_005_MRYP264MB6446141EA668A83766FD959380832MRYP264MB6446FRAP_";
	type="multipart/alternative"

--_005_MRYP264MB6446141EA668A83766FD959380832MRYP264MB6446FRAP_
Content-Type: multipart/alternative;
	boundary="_000_MRYP264MB6446141EA668A83766FD959380832MRYP264MB6446FRAP_"

--_000_MRYP264MB6446141EA668A83766FD959380832MRYP264MB6446FRAP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RGVhciBQcm9jdXJlbWVudCBUZWFtLA0KDQpJIGhvcGUgeW91IGFyZSBkb2luZyB3ZWxsLg0KDQpN
eSBuYW1lIGlzIEx1Y2lhbmEgS3JldXR6LCBhbmQgSSBhbSByZWFjaGluZyBvdXQgb24gYmVoYWxm
IG9mIEFsYW50eXMgVGVjaG5vbG9neSBMTEMgdG8gaW50cm9kdWNlIG91ciBjdXJyZW50IGludmVu
dG9yeSBvZiBlbGVjdHJvbmljIGNvbXBvbmVudHMgYXZhaWxhYmxlIGZvciBpbW1lZGlhdGUgc3Vw
cGx5Lg0KDQpQbGVhc2UgZmluZCBvdXIgbGF0ZXN0IHN0b2NrIGxpc3QgYXR0YWNoZWQgZm9yIHlv
dXIgcmV2aWV3LiBJZiBhbnkgb2YgdGhlIGxpc3RlZCBpdGVtcyBtYXRjaCB5b3VyIGN1cnJlbnQg
b3IgdXBjb21pbmcgcmVxdWlyZW1lbnRzLCBwbGVhc2Ugc2VuZCB1cyB0aGUgcmVsZXZhbnQgcGFy
dCBudW1iZXIsIG1hbnVmYWN0dXJlciwgcmVxdWlyZWQgcXVhbnRpdHksIGFuZCB0YXJnZXQgcHJp
Y2UuIFdlIHdpbGwgcHJvbXB0bHkgY29uZmlybSBhdmFpbGFiaWxpdHkgYW5kIHByb3ZpZGUgb3Vy
IG1vc3QgY29tcGV0aXRpdmUgcXVvdGF0aW9uLg0KDQpJZiB5b3UgYXJlIHNvdXJjaW5nIGNvbXBv
bmVudHMgdGhhdCBhcmUgbm90IGluY2x1ZGVkIGluIHRoZSBhdHRhY2hlZCBsaXN0LCB5b3UgYXJl
IGFsc28gd2VsY29tZSB0byBmb3J3YXJkIHlvdXIgUkZRIG9yIEJPTS4gT3VyIHRlYW0gY2FuIHJl
dmlldyB5b3VyIHJlcXVpcmVtZW50cyBhbmQgY2hlY2sgb3VyIGF2YWlsYWJsZSBpbnZlbnRvcnkg
YW5kIHNvdXJjaW5nIGNoYW5uZWxzIGZvciBzdWl0YWJsZSBvcHRpb25zLg0KDQpUbyBoZWxwIHVz
IHJlc3BvbmQgbW9yZSBlZmZpY2llbnRseSwgeW91IG1heSBhbHNvIGluY2x1ZGUgeW91ciBwcmVm
ZXJyZWQgZGVsaXZlcnkgc2NoZWR1bGUgYW5kIGFueSBzcGVjaWZpYyBzb3VyY2luZyByZXF1aXJl
bWVudHMgd2l0aCB5b3VyIGlucXVpcnkuDQoNClRoYW5rIHlvdSBmb3IgeW91ciB0aW1lLiBXZSB3
b3VsZCBiZSBwbGVhc2VkIHRvIHN1cHBvcnQgeW91ciBwcm9jdXJlbWVudCBuZWVkcyBhbmQgbG9v
ayBmb3J3YXJkIHRvIHRoZSBvcHBvcnR1bml0eSB0byBidWlsZCBhIHJlbGlhYmxlLCBsb25nLXRl
cm0gYnVzaW5lc3MgcmVsYXRpb25zaGlwIHdpdGggeW91ciB0ZWFtLg0KDQpCZXN0IHJlZ2FyZHMs
DQoNCkx1Y2lhbmEgS3JldXR6DQpBbGFudHlzIFRlY2hub2xvZ3kgTExDDQoNCkx1Y2lhbmEgS3Jl
dXR6DQpBcmVhIFNhbGVzIE1hbmFnZXINCkFsYW50eXMgVGVjaG5vbG9neQ0KDQpbY2lkOmFjNzNk
ZmExLWIzZTAtNDc5OS1iMGU0LTM3N2NkMTZjYjQ1N10NCuKYjiBNb2JpbGU6ICsxICgzMDMpIDY2
OS02MzQ3DQrimI4gT2ZmaWNlOiArMzMgOSAzOSAyNCA2MSA4Nw0K4pyJIEVtYWlsOiBMdWNpYW5h
S3JldXR6QGFsYW50eXMuaXQuY29tDQrwn5ONIE9mZmljZTogOCwgcnVlIEplYW4gUG91bG1hcmNo
LCA5NTEwMCBBcmdlbnRldWlsLCBGcmFuY2UNCvCfjJAgV2Vic2l0ZTogd3d3LmFsYW50eXMuaXQu
Y29tDQpFbGVjdHJvbmljcyBDb21wb25lbnRzICYgVGVjaG5vbG9neSBTb2x1dGlvbnMNCg0K

--_000_MRYP264MB6446141EA668A83766FD959380832MRYP264MB6446FRAP_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29m
IiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01T
Rm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAx
MnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpEZWFyIFByb2N1cmVtZW50IFRlYW0sPC9kaXY+
DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywg
QXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRp
Y2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0K
PGJyPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFt
aWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxp
YnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigw
LCAwLCAwKTsiPg0KSSBob3BlIHlvdSBhcmUgZG9pbmcgd2VsbC48L2Rpdj4NCjxkaXYgY2xhc3M9
ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRl
ZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJp
ZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+DQo8L2Rpdj4N
CjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBB
cHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGlj
YSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpN
eSBuYW1lIGlzIEx1Y2lhbmEgS3JldXR6LCBhbmQgSSBhbSByZWFjaGluZyBvdXQgb24gYmVoYWxm
IG9mIEFsYW50eXMgVGVjaG5vbG9neSBMTEMgdG8gaW50cm9kdWNlIG91ciBjdXJyZW50IGludmVu
dG9yeSBvZiBlbGVjdHJvbmljIGNvbXBvbmVudHMgYXZhaWxhYmxlIGZvciBpbW1lZGlhdGUgc3Vw
cGx5LjwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWls
eTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJy
aSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwg
MCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxl
PSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2Vy
dmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNv
bG9yOiByZ2IoMCwgMCwgMCk7Ij4NClBsZWFzZSBmaW5kIG91ciBsYXRlc3Qgc3RvY2sgbGlzdCBh
dHRhY2hlZCBmb3IgeW91ciByZXZpZXcuIElmIGFueSBvZiB0aGUgbGlzdGVkIGl0ZW1zIG1hdGNo
IHlvdXIgY3VycmVudCBvciB1cGNvbWluZyByZXF1aXJlbWVudHMsIHBsZWFzZSBzZW5kIHVzIHRo
ZSByZWxldmFudCBwYXJ0IG51bWJlciwgbWFudWZhY3R1cmVyLCByZXF1aXJlZCBxdWFudGl0eSwg
YW5kIHRhcmdldCBwcmljZS4gV2Ugd2lsbCBwcm9tcHRseSBjb25maXJtIGF2YWlsYWJpbGl0eQ0K
IGFuZCBwcm92aWRlIG91ciBtb3N0IGNvbXBldGl0aXZlIHF1b3RhdGlvbi48L2Rpdj4NCjxkaXYg
Y2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19F
bWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fu
cy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+DQo8
L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFw
dG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhl
bHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDAp
OyI+DQpJZiB5b3UgYXJlIHNvdXJjaW5nIGNvbXBvbmVudHMgdGhhdCBhcmUgbm90IGluY2x1ZGVk
IGluIHRoZSBhdHRhY2hlZCBsaXN0LCB5b3UgYXJlIGFsc28gd2VsY29tZSB0byBmb3J3YXJkIHlv
dXIgUkZRIG9yIEJPTS4gT3VyIHRlYW0gY2FuIHJldmlldyB5b3VyIHJlcXVpcmVtZW50cyBhbmQg
Y2hlY2sgb3VyIGF2YWlsYWJsZSBpbnZlbnRvcnkgYW5kIHNvdXJjaW5nIGNoYW5uZWxzIGZvciBz
dWl0YWJsZSBvcHRpb25zLjwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxl
PSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2Vy
dmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNv
bG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRv
UHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0
b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNp
emU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NClRvIGhlbHAgdXMgcmVzcG9uZCBtb3Jl
IGVmZmljaWVudGx5LCB5b3UgbWF5IGFsc28gaW5jbHVkZSB5b3VyIHByZWZlcnJlZCBkZWxpdmVy
eSBzY2hlZHVsZSBhbmQgYW55IHNwZWNpZmljIHNvdXJjaW5nIHJlcXVpcmVtZW50cyB3aXRoIHlv
dXIgaW5xdWlyeS48L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9u
dC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2Us
IENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjog
cmdiKDAsIDAsIDApOyI+DQo8YnI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29m
IiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01T
Rm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAx
MnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpUaGFuayB5b3UgZm9yIHlvdXIgdGltZS4gV2Ug
d291bGQgYmUgcGxlYXNlZCB0byBzdXBwb3J0IHlvdXIgcHJvY3VyZW1lbnQgbmVlZHMgYW5kIGxv
b2sgZm9yd2FyZCB0byB0aGUgb3Bwb3J0dW5pdHkgdG8gYnVpbGQgYSByZWxpYWJsZSwgbG9uZy10
ZXJtIGJ1c2luZXNzIHJlbGF0aW9uc2hpcCB3aXRoIHlvdXIgdGVhbS48L2Rpdj4NCjxkaXYgY2xh
c3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJl
ZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1z
ZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+DQo8L2Rp
dj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9z
LCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZl
dGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+
DQpCZXN0IHJlZ2FyZHMsPC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9
ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2
aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29s
b3I6IHJnYigwLCAwLCAwKTsiPg0KPGJyPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Q
cm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRv
c19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6
ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KTHVjaWFuYSBLcmV1dHo8L2Rpdj4NCjxk
aXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19N
U0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTog
MTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KQWxhbnR5cyBUZWNobm9sb2d5IExMQzwvZGl2
Pg0KPGRpdiBpZD0iU2lnbmF0dXJlIj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywg
QXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRp
Y2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0K
PGJyPg0KPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVk
ZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNl
cmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCkx1Y2lhbmEgS3Jl
dXR6PC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVk
Rm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlm
OyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCkFyZWEgU2FsZXMgTWFu
YWdlcjwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRl
ZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJp
ZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpBbGFudHlzIFRlY2hu
b2xvZ3k8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRk
ZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2Vy
aWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KPGJyPg0KPGltZyBp
ZD0ieF9pbWFnZV8wIiB3aWR0aD0iMTI3IiBoZWlnaHQ9IjEyNyIgc3R5bGU9IndpZHRoOiAxMjdw
eDsgaGVpZ2h0OiAxMjdweDsgbWF4LXdpZHRoOiA2MzBweDsiIHNpemU9IjUwOTYiIGRhdGEtb3V0
bG9vay10cmFjZT0iRjoxfFQ6MSIgc3JjPSJjaWQ6YWM3M2RmYTEtYjNlMC00Nzk5LWIwZTQtMzc3
Y2QxNmNiNDU3Ij48YnI+DQo8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywg
QXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRp
Y2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0K
4piOIE1vYmlsZTogKzEgKDMwMykgNjY5LTYzNDc8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFt
aWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxp
YnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigw
LCAwLCAwKTsiPg0K4piOIE9mZmljZTogKzMzIDkgMzkgMjQgNjEgODc8L2Rpdj4NCjxkaXYgc3R5
bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRT
ZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsg
Y29sb3I6IHJnYigwLCAwLCAwKTsiPg0K4pyJIEVtYWlsOiBMdWNpYW5hS3JldXR6QGFsYW50eXMu
aXQuY29tPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVk
ZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNl
cmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCvCfk40gT2ZmaWNl
OiA4LCBydWUgSmVhbiBQb3VsbWFyY2gsIDk1MTAwIEFyZ2VudGV1aWwsIEZyYW5jZTwvZGl2Pg0K
PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9z
X01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXpl
OiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQrwn4yQIFdlYnNpdGU6IHd3dy5hbGFudHlz
Lml0LmNvbTxicj4NCjwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRv
c19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwg
c2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpFbGVj
dHJvbmljcyBDb21wb25lbnRzICZhbXA7IFRlY2hub2xvZ3kgU29sdXRpb25zPC9kaXY+DQo8ZGl2
IHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNG
b250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEy
cHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+
DQo8L2h0bWw+DQo=

--_000_MRYP264MB6446141EA668A83766FD959380832MRYP264MB6446FRAP_--

--_005_MRYP264MB6446141EA668A83766FD959380832MRYP264MB6446FRAP_
Content-Type: image/jpeg; name="image.png"
Content-Description: image.png
Content-Disposition: inline; filename="image.png"; size=5096;
	creation-date="Tue, 22 Sep 2026 17:56:50 GMT";
	modification-date="Tue, 22 Sep 2026 17:56:50 GMT"
Content-ID: <ac73dfa1-b3e0-4799-b0e4-377cd16cb457>
Content-Transfer-Encoding: base64

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
ltEM/UQDV2Thcvkve8WgYp2fnv8A/9k=

--_005_MRYP264MB6446141EA668A83766FD959380832MRYP264MB6446FRAP_--

--_006_MRYP264MB6446141EA668A83766FD959380832MRYP264MB6446FRAP_
Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;
	name="=?utf-8?B?SGlnaC1RdWFsaXR5IE9FTSBDb21wb25lbnRzIOKAkyBSZWFkeSB0byBTaGlw?=
 =?utf-8?Q?_(3)_(5).xlsx?="
Content-Description:
 =?utf-8?B?SGlnaC1RdWFsaXR5IE9FTSBDb21wb25lbnRzIOKAkyBSZWFkeSB0byBTaGlw?=
 =?utf-8?Q?_(3)_(5).xlsx?=
Content-Disposition: attachment;
	filename="=?utf-8?B?SGlnaC1RdWFsaXR5IE9FTSBDb21wb25lbnRzIOKAkyBSZWFkeSB0byBTaGlw?=
 =?utf-8?Q?_(3)_(5).xlsx?="; size=36986;
	creation-date="Mon, 21 Sep 2026 17:33:05 GMT";
	modification-date="Tue, 22 Sep 2026 17:56:48 GMT"
Content-Transfer-Encoding: base64

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
HMVfZen91nUwwGYb4UPF4CKRicZ403R/YHEfTVsEns0LH8lXcJswIRqvzzm/nv/p5/uH199lqfEG
UiVF7iNi2ciAnBdxkq98tNFLs4f6gccF5YWEmSwESJ2AMspYrmjMfbTWWlCMxUamViFXOOYYUsgg
1woTi2DUeDXITP0ZqJXGuVNJ49put9a2Vfsc2yb4Kbyd8zVkzExypVnO4Zjiogmp2qGssm1eistC
ZkyrGiIYf2UrqGAdnIFmMdMMV8eZorkOBV7MKZfAdCGDQXgTTYzpQzi4N6YLD59I1TApUzosB1sm
EA/3wfhyPo3uZubo4nrQGi5eJjMP/3Z5hzW+SRAb5c1U7wX46Kg8tkbj6AoFjk1c0+6YthuRHiVd
6tjPVYmz/A8wOzzyL9EpiRem3Y2IS0mbuu0T4hEQ1L3Pvz34AlBLAwQUAAIACADbQSdbbAlhQfk7
AADyRAEAFAAAAHhsL3NoYXJlZFN0cmluZ3MueG1srX3bjuS4meb9AvMOAbuw6IFLlTxT8npyQFFS
hDIkpVJSREbmzaDXU2M3bLeN7vbszNvse+zFAvtC+wpLKk6KIBn5K2pzbjydlSRF/ofvP//f//W/
f/fP//GXPy/+/etPP//w1x//6Vf4C/rV4uuPv//rv/7w4x/+6Vd//+XfovhX//z4u59//mVh/uGP
P//Tr/74yy9/++3Dw8+//+PXv3z/85e//u3rj+Y3//bXn/7y/S/m//3pDw8//+2nr9//689//Pr1
l7/8+YEgJB7+8v0PP/7KLPPD4+9+efzbTz/8/utDph9efvnP3z388vi7B/vf97+rv//x7//2/e9/
+ftPX39atN//9Mui+ftf/vvXn27+u+b7v3y9+gf2tL/9+W/f//7rP/3KHOfnrz/9+9dfPWKO1q3u
F/Yn0wT9Zvxfn9AXjkB//9wqKrgqs3Tb/ct/IIT+9V/+4b+c/sf1GYd8p/pF2fRDt6nzZuhBe5DL
M5LDGen16lX9TrFEstu+dB/tDN34T3/7/c+Lw86Y73defGI3tgYvPf0mfFwZf+HOw2qMULXNW8yy
oSPL698/N31el7Bd5XnXy33J9apq2NX5UmESK7yJ1MY5Vam7Z70q28WQ61XzXD0v30BnWJx+Lk9j
L1j8Zn+YL/z8rxaBkxEuFPWc7KNdx5+EIoEOT2uugS5O108Xzo97ALu/YBEWwN05mXzp5Nq99368
9qgGfto3PIWhLD9BeBmsbzUXiGQF3laVwwPNrp0tcqYMvZc77FruPCrGmOyrp6GLrnnrUVVVvuye
YY9A2ecYoQuK2+/9idx6aPMWrIU+Bo4vX5rcYOwjHbEW/NaX73X+AOo9f923jKKCSSxl2b5fC0X/
FpTy6RYXD3S9QVsani0kQVH50MOE+cUXnAjO8D49iaIvDuGpTdktM42Io5Uey6bIm/y5AW1uCRgT
/LZ9Ywil158TfFEE0T69WkeD+T3pjVwoMKXFQum7dwCs35j1v8ze4OI9b+xSzd8FXZN+YHHBsoih
wsCgZpECF5/qy0u+Av153RJBqVp20bvLJS2Mchn3C3HnCI9NV3ASUxrpJ6WiTjq/f+6yUi/Aahtz
Mt0ZywMNCti367LeyZ7m2zWKew2kejTFJzg+UQz6ImDIcLxynvqu3P8HAl1BItBf6T7DksW0YNAP
i31g8lqbBeTHUFNSMCrfy0E4hGR+C0RhAZ37KUGOfNtpuaaEDxEpiqX5/TXFPO7Kqmx29zxqctrX
p5yyGNNEddl71OV55dCwapTBGYss35Y6/zYWBhsbZUdwzAyEb9PCuX2jCEqwIsBXZ6HnsyDGr/nq
sU47ZDBcNeBr9B3QoUnwUx3uGZUoKQTmVoleH/+Ms2Ebiyt4cBJSXtJabxBDlrK2CmMuYO94ZTJO
r467+jlV2yR5vWdhMn0T9/Tp+y5mkbGNYMIbhdYGirMiSw1lqAbFCjm0x6yZ6Jico5lCiWKbqF5d
/9bYOL4/Ohg3gnltm0fv35RtxlGLWMuM0obpQ3oybEfuWxyMf8e0nFj317+j3m9ue86wQNnSY4K3
fUIMF71kKuteHKU53uFDpheu5De8rQhDCrevzqri+GfYxRvCd8RGbyUlOMPEY0sz5PuTut0ZykbZ
NQ+a53jw/PNtw6VEat0ai+WapYw2TnoUt5YuttU1Phx3wr6ddlr01Y7xiOp+yWLmqAHM19f/qcuX
EqNGRY5w7w1sL3vJUNles6YhDWeh4cmIB0P8w0ORPaB35xacP6gHwl82BmqrNI1zTCKklGO7jZLN
kXeEKYXFYGThs/MXdO257XSzTtY4NojSuesm37V5V6rr/74qKac461K9xa5gMcrQ+aCqNaLUqP40
E+wBubTr/IEaCNM1wlHfr2rXbq1UE0ujzHWk8neYTrk6wj/8F9e9prIeEyZKD5voTFdbQ/Mo7laZ
89tMaRljXGbL3vldkWWxwMhxVKzrl9xANkzrKKU4dr5Q17tnYl4FoZWOWLqklMDMoUoNg8EUjpDF
X4RLaEwZliAPlESOInhsM4kIYWX1Eg3OZ1mtGxdErOPReL12IYy2yk7HMta1tYQKteBb59+UjCGc
Zm/RgKPcsaW2Zb9S156YR+J8RN9IpraaEkMz/H2dO2fth+UrTRot0DbzgE5KKpaIbjkI9zPNrwXF
vMteMS2cX25GxSEizCvP+YdcYWl48cF5+2FNcSOQIzuMiCcrI/7Tl/a19ch49wHNXwij3emLVTHu
H6zKKOZx3Pal+74BRb+O97bRUdW7Wu2A4knSlCsH6mH3eew/X0lGLeh3frnFfKkppWvl3P367Vnn
nSN9YvcSCoZJP3BHHVU1xliWRitE/At6aFCberWq4c/AjZ/0BimWVm84GqcvZcJI1kZD6SGBWrfC
8NAQ5Q+963yjSUL6qvU65nQvMV7nu2qIKFap519YAyNWXQ0xMK4tdPPXmxobi+K178zfu3+trZsB
daToVqnzMPiLy4RZbyQCpXmLSbxsORpVUOucutHmdxTVw7BzXmujNTXQgmRLV6t5ZNfeeYZjSpjd
q688pp+ixvLDxbAkXLiW3+H3xEACYyI6T2tNR8OMe9NRSOH9B1Pb0vcPesIjbDZQxN0hZMe7kY1P
rnTeU2Zi9vZ+XcCGjKmBqz5nlsGx0nUdD4y8DBgJFNX1Bub/FD4vT9BRRlnVGgU0OrMix9+3971w
KvW2jbUBnA4lumDLUBimjKg60wYoYw9I3csviminHYEEtH4cweyeI+8z/o4J2OQ9b3GKlLmeMd0S
AyWiZe0qqrIq9XOzqNS1iAvsx/h5v4MR6jWv97eFEd1Cb+vKOYDRcXEKU0Hj31mlXm01XqI402sY
6RkWm3wTnm2jHu3+5ukVkRj4cOZBprTBDuzkMNMHcTUjKt4RQUYYVT77JBCSuXQZH+J/HrpJME+M
HHIRCpClL7ehJ5HBHNNo0JZAm8zVVymMMI2h6vP9fMJfgAjmeKPT6JPawLybZOIp9vlQH3uME2Rs
LN04voUj7ga7pWP8WVzI4qNH8VM840uNxjUgrTAiSseO3iybIb/Wi6Ev9wXG7L0T+GF2+n1D9TLC
m3SrOHWcrQFRxL1uVY9X9QMeOsTrBKNx2V6b2SDSPiZwnM8B967u/7BvjcUmGSdAmWNZeOEVWm4k
V2eSrTRDHMMc5U5EICgPR8uDJDgejB0xODD4Q5U1cWRad6NEDqA06lBhtiVQavQ/S+jsNGYoq7D0
ONo+PvsHKOgm0VnPGk7S0vEJBL7rKl/gmBIzl8oW4zcTGnHkt/xgX31OV3KIzb/A//mf4+a7FGHE
oN98IVpuJ+vc+uaq1VgKXqSZ63QCwTZgRGyhspqwmKbd6960Opwc9Meptv4CGm/WRZ8u5/zlIu2e
VaafYaxtX5JeJ2Ock09sCtCMqzWnjpMY4xSr17qC4Z6T1J11bvsHeAp17wglLM4/2+ZFIobUm+O5
CcV3vPkfd7Hg3gNmYDRDXlv3o8MbfJKgnIjobRPBTo/JpfQ4xY7maenDD9d5oZKCUCxhQb/F9GcG
srjOkToKc79JiGWCi4hjYxMylLcLoD0TkDJes7aqCZeijzB5aJ4dl1Do7q/WP2oMxyatBgNo8k3x
6zHOOlsuH22x2ejH/lTCWNRthjAFMoT054bOs9XMj7ES4x4hWtDW9aLe/tPnVnGON+qBrN3czVZz
zln9bmz664u+tWqtdgamY7VZ/8aNm6hdCRdWh5/d0GEkvIf8mOo/wl6V5gm2vixP4MEKS5+LQyK1
2xrbc3D9G6PTRPQ839YYuT6VpjFr4qHrV1DYQGjIOHD8uUaTMCpEvq7r6tWxoB8DuuLxTD4bKPlc
pkFeAlA3jF6XRu5g+VYLN5YRSvZYn4TrF0HcfaphYfDXIlNvjnd1XdXxEi/zoYhSxByzu1d1v2lg
ahbH9hif6BfKz1dv5AV6GKHJam1Y71l7SKSxmXp1M7x6Ep7hNqrZ7mH/weQc8naTbvuaUlStVt4A
yg+//+mvX//89fe//PTXH39wApD+fdHelbH/+vFNHQX3WGRLQYnjdQ3kH6iy06uyyoCOgNGPg+ln
MUb3vSk+ed9SEvU0qsumjHDUOEE88y+6vO9LmBY4+I4kPyXNWznsBp+tQ26JKFrHUIfc3pSlyekF
8ReXKNdvnErK3RSIx/5P//k//vrTn2AvN1LL/lOoOKf/+/w3454xSjx7BqnRLGUY/7ysm2tkRD+R
RC2H2pH9t1a1h5YnljdGrHtc3BiLgkU5feCwfLfDymx6YF+FgtphSQjJqwF65L0+sYBwv7JlkOtl
X2pMMTHyFBs55UiIl+duC0v83vP/NOV/n+k/63JjhE6sjJ2jNtuh6JlGsUde3TrUaEzEKExhRhKn
S/KUD9koiY2KmcOKGH02IPTm6myJi3zID6vPIWO7Pv4sE3Op3++3YL4tjmkC6ZgmgFAyYwvB+IE8
8CjGjN6w2T7DT987ZVLWdUfyZYT7Yqsl1AFNzkryFDBmjtO0GgyKY7jcXGdxhTT7gVKOStcbclHZ
EjNM3nTrD4CGkPb6xOGMn9d3Pb1mfcmSdN3PWZ5Mlt8rjsDpq5ojjup1hOEmCEMT8TQ9vOdyWBIn
fZV5Qsv+tQ+FINAc4ONXisX0FAtPhUMmEoLiep9EElWwgMPplQ7fim5961BtCZV4lh9sbVjqsLy8
sXStuShiyvi2WAKTdF368lPXbOOfnq7keGT/mcveJu2k2SvQE3rGuVOi9Z+67IqWcNRA7Vo8pdgz
P3hSDe3KeMbKlJMR/H8aH3JvYLmvJxmLh9XOKEHZXGf+BE68R9v7jE4kPXxLYsIbm04yYz2xXw87
690SgJ/Il0SEXrnZCkyFkxvTqG05KGAlkd3FytiAeN3UxLy1Gr2gQE/PQW5LhELnbkudGOgaKSVQ
Wy6AwFieHJ02D/tAnm5ikpOPAYw/rdlRS9KgvB5qJhjL334NpVB7GUbthhbctRYuGDsuQtwxmirV
DN1zUwLLEvD6cCt7jemXknVvbKWCxIiyFli/m4xkiPe060qDWqmhN1Y7jl2zr1ZQj/DIIebkB4E8
Fsv4HvaQiZPaTBxg2c/++BwFL+W0Lp61LlqfdN/oDnDuWvWCx+ylXXkStUNpd/zwhOfzugurLKEC
p6neYxLQynsL2podods1sldKkVRkhsPyoEDNswUhSNa3EcFc8Ffdv74Dg/ejTMIh/bOybI/RW+tk
Q990nsigQhvyIsaI581Dg2E1v8nxyzEKkms/SKIpZU8MaKAn64OOjPcCH3OX2ZYq4oy3sYFRjoGu
tmoJs+XY+oTb7NEPn5A422VKxylBZZo5GZMBTqKIERXJ9gW7iXA3+UiGqN0G/GKOjHlFuFjA3L8H
xLEv6PU+ufkyTOIexVyXNdDaRsf3IWHe1BnjiKWuCzcU919PUJF3xUZvYyGZTUpHHYOZxfx8VB4U
e0v9REmuJV5hJNYKYSd1st50arhGF4EIwv4VjVV/3NBVzNXLipJmRTv6RChQbB2XPX2Hh3tbZWOt
GbG5u2DxMpHdHsKv202UcNfZWP74719/7L/++DOwL8j++GF9fEiixnS7BAqJIxXiLye7wlnW/5dD
piSXAliwfaZ2FiahrNtyZD5AZek7jInEaVkcPv/FuvPsl0/8y9Ea9T4spgklUkQwB9CQL/Rz0+R6
KA2ifgPe3AGnGvshjDm4Xu4KneSioLgERl7xyd4++xRceUG7F2IBJdGvwASJvszrvOmBVv/hng8A
xX8G0VcGgXNbsGROwp4UTGxTiNi6I8ZIjybJRNC6ciR9kdZLgShUeB89VBcuKlfsZX2CNmlC6dAN
YN8EOWd1GEMqeBkY1RxlqrA1CTHQZcpcazxU4GEvmq/F4CS9f7D0R34vs3RaIU60gEo9fl754FDx
LLttMomMsfoEpYvjopicDuvSxSnFfnhZYubUftw+sBV0wcLQjaYxY6kvPf3jayDo1v0uM74SKAMa
qROnPL8hPDc6w08Y4bqp8NIJdzalXtnk85nOw5NjzwuiVRZzgyi7Oe5XcVyahYm7HgSWst4+OMC2
Hq6DJCEQwT7c5aDekdzmQELnhJ/4XtxgzqrIqUEouYpE0QhJ5tisR2AcvJt9Ai1nNFbghjdiTdg5
Ee3gnPQnT5dlImSsm42njKqCU9CZwyi/8TVD3TKCVZnpZpZY/0A6pv0SxZgAHYrGsJ9qihlpiIef
OM4NwQqFo6F4cgJnteq2eQWD1CcP8qf4xOo+vpNxwizfYTQj8HF+ExKS0rds3+t798ggpYs6IhhT
jwX8kag5esyDsR6B6FHUAMGQAQxnohc3Fs/bmiLB1FAyZu4URuPx+VYuYywehyqOq8IIAuItuJv8
fkaW4lTd8BvfVtVbShg0+5nG9BxAjtHZ8vWSy76/RmxLL6utwhxL6KuflRplpz2ci9EqJppwPDy8
1Z+xU4EdkNKf2RGfncW/x1E3HFrsIXiTO+sMPmY0HcHO8Xb8YVVbBM+QKqO8gWc1nTY5tAn0X06f
xZQVZBsRBMwUoudalrMOcFfedQZGJNHLKkJLoJWC48m14LC/JC02IkGFeUtYih4VZ5l1dBG6t9zo
3n4ayjoYUju0rjmiG++a6dBLRBDJW7Xb1ApO13vzck8c4x08jNnUizH46q0ZGUvKzfEDJeUfb8VP
Hl4nwKYN+9hGZFx0K6d8+zZznsCf34HOCUoplTVCQg05cj9rbQxXmCijZ6bCX2h4z7rlSYKX1SaC
VQ5ZTjoBNnzLutQ1F1KgFJW2JgAqf89gMEiatdqRWOJ8eAKmDbEzwMHhy6+2RBrRmC2BZZeTREy7
8gnoeLMeMOJ9tpuR9MBdC96fAyCNJQw14I9u8C/4o4iZFpLF+fvrAPMbnR0ZLLxw23NOGeoGp1XF
R88mbnmLW4NKE143bmn9TUl1SPcOUpltMUGwOe4SqGOSc9KmYMFlu6GKCcFptE0j7eSodrmqhhxo
j5FJnNJzM3Yns5Xuo23lbnVrTdiiPXTRZFrvecqidlMYV5lgBRWxLFqnZ0qXN3kPjPDTi7rKY3Gw
Lz3agCGb35e1+DMm0AT3C64Py79atzhGbIg4QqR8cAJKoQf4fGpUcDvw0ndrMia0w6xVdn7YGS70
Y7WPMXbHap8aGMUgp7ju1Kh0P4JwTfcrOy3sbsVHDt9xyzbYnznKoUc2eu1P19LGNYL1G6E9Iv2u
dKrK/cvqtzEVGt498+IMByBsU3JCJykxTAdydjbyw9ZBrSRFyxcgFkj20R58tH1v2ARweyCZ+OZu
UI5hr0QipGyPmWrWFVgLYH8FISugNERZ75hEBcekgpuP8ci8kGvWrYGQpMiGaAWlfCmPcTB8y9O8
bw8TswgxT3+qwJVPzF7KaXhxe27aYzk29oEJ4wQBlPieRuK4TWd0tL5mV2iamTgTGD9GXVw9Xa5f
GWowQSsYAorZmWxJcFUDXSmhJPf0WvuAG/AXRML3l8kYs2BTpJuidDzxDZt+qFZL268MRqTxpZrx
Mte+fHSWYyY5BYFvXMK+8YW4S9RMgguRT5MLhrQ9r17B8mUmopzfiFu0ypAtRhGOVKnAzozJyyEe
zhMou6qubLLd0EXQDKejW/LgKz2W8Pm4yya/9MSGO+fEiaZuKn5Mnj+ANL/MqZcUYdYMMAqcvOkt
b3bdc4EkIqlCtpvA3DfFOFksbl18ZyRHA08sS65lUuAyCKtsoxk+CmBYoqGMz8L9hCqwVycJFOgp
9pFoZ8k58ej8pD7WJ4WQfAbem8i/WyHLvVQRnMj5QmVyMecv8EqYsq+ShCao6N4Nr/LEKVILvAD3
7eMuv+7f41jQrqpKqCg4590fQUEoj05yYCri87pcPKlWNdD26642dd+nK16MKUHzl51hIpbi91UO
S/LNyucstxN49HPXPndqyIGVjAdmnR1/OtZgHKfJ+NX4vtRYqG2NYgVMsWdrdnYVHxJIsbt23hYC
GRU2mF+yiDi9jayDwOkOGb6DU01lGJSoLJHMoIcN0AN4NoAxQWFQZ0urmMy6CBfFdmkDGcDiquSz
5J7ZGb6eA7Y3ChdFmgFbR01rKLNj17JPMLw0/tFY05XYmq4ZfQ7OifyHPY8f5W+vbq4t39qc7y2w
B4Q8fdQxcHKWZJ+c6tznWrUVpqN3L3PG8QywRzIybbLn4R59Vf7NUBevPc54g+IdtCvg5erndj1u
TwvblhtxQrIXI1cUNK0Eo/g8xunUfgzYAinLIrMXSYo2suR/faIsA9ahHCTn2SGGvjhvNbbQ5lQB
UzSS45KHyRsWIBLmNKFsbZPGLepxmoKjRkfQeXqPcW0nNvmI214mfUoReOUjmj1fhHeuRE1ELPO0
K72NW4FC+KCKp3fuaf+ZCYLmZeBgfrqdYzsGzydIgUTaD+8RA1YWUXS+mxOPEbfjsqESQ5HDA32A
N8S6khf2Oa9rbB9xw2OcrF4j6TSB3ivmWfjnfOvEUwtdDbZfeFn3+QzJ6uvmSd0if5VVnCKqxqJZ
2IvK6crH7pbEXboaKGI8zzJzanB54FELnQGzWdoRxWOzYjtxakYt2kRyXqzuPF9PWGxnQiH0m+G/
fv+Xv/03OKTY38tZMY8uD6dPzWNfmquJ4zzvnXo986uZjzD5mGDA1za0xi/ZsoHGe73LG/rxvIRM
WJIa8nFFz4dhggmPuXXuKiOIrKEphJO7D75sNXDDtGWWpYYia3jJ6qnPSTZt2+P0Q3pMK9tcPKJU
XyP4x/6P3//4hz9+/8Mi/frnP//w4x8W+q8wVEZ87+CR8Z21HvkcNibedkS+d5BCJsoI55lPcV52
zLvxUPoomu+mR2/cynBvnMfoBRj/9q7rYI1VrSVirGoxSnNwH61J9+bkzJ+ueM+rGMvv9D9GjibJ
t3lXlcsV2Gj3QkP3kva5qIgiDW0YI+jka8484CIEGwUVkrTRNocGQafMi049Vj0ZHkrGFeLqPQU6
wi+e4BzsdEt5bBNVLFj2Xfr0j470fO5XZQpTAWRK+5NOni72PzScG6cQRPCWc2j6xMcZct4Ndi8d
2dquUBHTS4nlddg4gH74Z4kmY1wPeDZgXbLRuvzMgZlyfpU1o7WcLahjOK0TZ1Lch5J7cl1+ljBK
UqZSIvwCLh3D0+bit/q2jv1ojS0WUQTMi7wck3xuduv2k2oEVegFdl6c/MmxTBeLGY20k8kwtLPu
9mqkU3U5pbxdFlAIdTFK8PTZsDjTKcP+fenOEvzwCS/QLLjz59CWWmie8KybT5MXz+BhMmPXydjI
CJU9zZARZIJzpz4iP2axLTHGDtLUYAigj4CiS1/RxbhhJN3RRX1PRAG366YTwqdzMpEgDooYBwky
FA0UqmzwZzLdY3EJQ137esUHzZaC5oWNFbmAfb1YvUEbM0ymjl7KwNg/p5Lhua0IvNPnF74B6/tx
UtZP+Z5HePO6JLx02zZMe9jr5ybb6OH5nnaMF1/r5De1umYEsVYBRe/V1PUJ+bkUnvc5jjuMneqe
VjWqf25KaHTuUlTcakDuX6F6WQnR216bNaLV/KmxV/YHsEH3sOollcyG1YFbBqaJzxGKPeGcZN32
ni2vsAF3GNLKRYxVXcwQitMIwxSPS8+0OqR2iMUrWlBWkmqpYLorZldDvs+bOF/Q1jGNDe5bAhPp
L4dtTKbMOisfp1MNEd2PpwIWg9H1dAjQBVpyOWq/iY2ej7t4ZuhCKOtSQAVcF1VLqCDfDW31Of8O
2OIjQL97FRK7hmiqBiZeo1VOIwRDstdd86f06g5ASTNCGFlGbrbsY/e8qv9/ilZ/p9uavmMCjJiE
5vjub8+d5OtfJe17TCiM+ankAfI2G1Jg7qnZDziumgfebr+bo5mqXd5jrpTCEeYwHHp9hRNN4fJS
Vhjt1KsGd6jOkaftBrTrBkH+h4Prp+2z0ZKM1Gy47ybP7nLghkO7IkZ45M3qc4VfoL0oLoWhPG2K
HR/9ODIUkSwwMtRmRQEzYOcMH6mNyMJs+QSvGgnRI/Aay1YJ3tlxP86Iz4/NuMvv8bU0HTSPm+0S
9XQ1KFddrsvnnTMQFgahTj5H2Gf2z2YBlG1SIKq45oizceeyodaM2/TDiBho6XBh+rzpGlhE55op
bmwaYoqGdATRRlum+K6Gjqm6yOy/6epYlY2tNCvT5h3YCxTjCzc0PZOLcKfYVrVa4lN/3dkv9SF7
7QivBKO0qElpFLbb7F7psVOeHUgB2p35VR6cAV8JfxHsadv3pSPFHl/LJn0GloYHZbjrshzqzOCG
DcYognlDr9eebUhcC8GJWQDT0bbKSRgzL84yfScL3xqaYKBiwrHuM7hZcD1UCs+1dJ5bhYWMS1sZ
B0Q7SegW3S86ZAViHpXAnMCAITXjkfc5CthJ3piFFuE0cTE7/puMRbiEPeLh+0jw+InuPKVjVJrM
iUpfq//j8jCouap1jGhctUznA5SnxsyAzFHC7vfYWI4Bvf6CPBCYX9zKf1K6lnaQrEQ4Im0VDZU7
B37I1otjfmMJ7gYSUsGuLyErGFrp7+gX9I824J/1kWGV7XfcMze7e+7zRV7leuigLiPvKB3ftIws
JvtuE7DQbXJl/gV9yAGqMSBFNpUD8x/bTXX6RusYg6dreScGQfFrV1CCeD90VZsWUMc9dE9LxQnF
GErBV1gkONRJ95wJaiSz0xTnUZddt+kX1fMSSCiXex5tmkDstioksg4eQlDdJShqYWkM/PK75msG
O+pC3oNGpwPdXO9Inw0EpZb3jIUNNLAvCS4skQOxbIxi6/g2y5DKobdHVbervHmeP5bytqjx//2i
1pQiKbO71N8F5QPfsRk6A3hxM2DghlcMcVbx7iCaWhvFipFaGau+IsZadMD566YbVlbCrEcJA8vd
DLCkL5JvB2HFu1ejtZ4Q7eajwHOunHcu15hNiIZIAztZ+97Ky9Xr4c3QJAHO7IuvZobeKOQOitwW
MdbA5a1vQuMsEZ8yY6uA95PkQoUfk1lg6jFvieaDrbuKoaUazAspfZhIForlGKVEF/WvlYJ9/0Vi
yNQ157pbtk8GE9E3jMh696RfcQrEGky6OwDvy+BWO6QN2TbidwmhW2aZylrMsdo8vUf0CwUnp3n9
GXCC8/K0HwLW7QtjXCxfBqDHLizzgfaHlkmNSZoN3Roq9C803vyB2PWrHjDCdFuteqB39+oFJj4Z
RN1XTo3dY9S3k8IGEuhssrYbCA+osWpLyRAZ0noyCMhR4sZumG1+TZEK9GKfWyKXx4FA3wqOfF04
ipgjQdUQwVysVJ6bZNxMrw1Jgh4LyctW3WOMX7qSYRuyJI77fLBjieZf32XszSOtq8GAPV7WfTyn
JglqtlUDNnCn7OOIz1neC8T3fRIdOFPUBLeaSZ5iRYFORK9sDoTvHutqaXiA9x3mTwMC918LbQEs
FKrTLrVzG5AevhWFAoG2HWlB42R8pm8E2m70YKgM6mTfLdPIBqp72GCoK5keCoY8ljuBl5GKDHr6
Nt0MdY/ZameEh6iMnl0XQTVoRjnRdX8/R52PhKhjEPpXKLKqYpjF87NmLuCcUx+keqkpQ0ls7pcM
ZeOG6FVVlarR+aLO6+cO3uLAQ6xAnx7Ggnm8M3OElc82CmDlHmoHXrlcUIBeA3K+tbmZGNH33M3N
fFzm+ertnjwI5INF/rqAwiCuiO09fHz7XSyuM71nSgEgEK0N+mU4e4qqIgKCawp+0sem65mdtmR9
QdnyyZFLqnx7XrxtsnxuGc1NK+JRV3UU04i8uuXfdvCtLju9KQeg9zAo2J2vJQnNCJG7xGiOjAw5
jJ8ugt3TC/XmXK43xsC348K2trwUPP9pat6dKy+ALpm0HzgZ1F0Mf6sWo25jYe4qUnDbBofsJqDy
KOsdNqgIGD4KCq9QLAxzaXvjRPVdtDWbebuiRmwj2m/6Gg9sNCpUyJVBpRH+Zlw6J9bWYspwisch
A3d905EefGWAEvG028zomB200YFss09cF2JG2wv/dr4sSjL2m8VtFzk+TKOd8t092kqgxOtEA4Lm
FR9ejonoXabvi5YeKnpgorPsq9hgfVx0wzvUPgtgL3jysG4HTBHaIXzPhicQ4EK9DCc0fh2rzMHB
2Us/63FtVxGnfc3RMjMYKWtgQbiwU9uNK+/z2LQ/j23OM8xzbPBv8mwcNa43UlDVxhblxfYpWuaO
gDxlxX6Tue5xB/TL1ij3LOrcYtS86cvOjTA/1nVaPFGMKrdBhzFK2gLHDZCwr5z2E5jgCTT0FeEJ
xoXb46buF899p64DEI/NkBpYxFJYLViQ+lzUtW8eR4ltQag2rn10bFCoImhbe+G3znwqXxQ4YdJo
fGDjKj9+8dPgWcrXN6W8Y0r0Rj6R98YpMbY9DMva5p3ly7Ef0zdyqifm3MUcI4VRVOpd58yJfnzZ
qEo/17DoVDjrDiVuJw2M8A6zV4xIvWXOlz89r1TTPzeLrDymSAAhGvVWuDsMuhqwcA+1erY9ob9d
VvjzeDGnKHsZLTfQ6tdpGafceU/Hk31HRhLDWzL64RJUldv2mrH5UUP2G6AmT/t3lIjGyL6ezwhT
PHsTRd2cl6FX9ZLzJ5ykYMkRdG16fXLn0hHYBWPkwrNA0OjUsA/ery+QQ+6phqsHZnh8iUWnIyRI
vgA2MvYL9UNcxUW54wxO3RgZuObAGZw3HgAGK1pD9gwNBOXzS8OuP4k58sC/RJ9hRNXwGskI6PoN
u9Cd6qHAlmlndDEfU1q+KZPSXxYlWbXVZIllZj5q9hd9kDZiOAdJojSwVH0aC7hpIvYkWRpUI1qM
iqJEQP9kIAN4Zq5Dghm6K9nhg3zwR00J4bu4wuZKRW1uWd2TGnjTczmmSW6nWZJ3hcBP7ghflEyT
hLNy6OOIzHFIYB+A8LqiDr23Yzo2OIVBA8LAib6P9XMFbJt5Xbt3i9FgJHkrgjuLGwMhTPM4jOqx
jdaMnkWBQgIXzFJCcd/8et/qan794RVPAlvmCQ/l3EwjObSxlWtjwIHb2NJgqNWTpzLkWmMUq6hW
q0wBzeygN9bdoC+ThPE0e4sGbKze+bWEE1EEq8I0pIMF52Uf//pe2XcrZ9kmu+NZLdiwNw3K74Or
nzVFHANNGcoCCwN9a1iKNZ0mTtwSNqM/pjfy2FAK1B9zA5t5qtE6/Uo4JoR16KnJoROiQqZvIJGR
8wE4qoMFl0bIradedjWitJM4J4SsjZEDtIOJt+ec9/jjACKMul4BBUEgYcGjDPcNjN+IHhsYAzNI
fdmRASnQ1gzZuS624DeqwPJ22siIh0w/A687EqPN7DqJ2fHcfa8dg6ttBzGgZLnoMTA2eA7Jlp0m
23FwOS+KOAEG4WLm16luSfdQx4iw/O3XYHXqNULgUbFGy/59g1jNd0ADRDwDESgAYPjCNS/vBAH5
koGDaI/VNo4Je1FRs7pHu82/WD9SD9g1abHhiZOSDvro+SBxzDci7P58I3rjMh77ZS2N3b7bvAzY
adpkfruoS909j5VT3/gQ7jV2ulJ1izhhrRq04wns89ogqRV877Bp6mllodtknByW3xMC/siYU31W
pxGlXyil9eo9qrSnaUDaKehY6nB5KVhutAYpx+mM6hByKWRPt4ndmJVtp071MsKbdKs4BTZxuRQt
F8YL1BEpEEnyzZphqCdSXvTWsTd55HMgvNvpArF+i5YEQeOmV30mkltgdaaV50Mdh+lHfQ5sXHpN
1zdbOBw742E7ex46SifskHJJybr1KMI8v05B+tj8u0TDns62Gx1TnPZzRnEHUoRdvNSv37AQBslz
ziun/ar57etztwZ6Ky43nRbxAVVGVZOEYg1n9pArw+tH0C3BiEUFotGyhpKAN/y9GKfbesTJdoNp
G5FitUztXkB5EiJksO2WD21hZ+/WfHWfr/UCdzjJiSlnSN9X2/ARXhrUU86krJExZRone2/99qzz
Ti3UFthc0E+B3pQC3NcpTzBNwX0Tg5X+Ljopsi1FbD7yuBQznzERMOe2jdFjOYbondd7blJwdDAo
N6BJEypbGtHG0rEL9315E5ehIUccVoOmGBvtWcxxBwZ4DO6wXBtQx8cy3cME7vs+bHYCnrKzyFCk
ejcTPbBjHHu/FIZNFntFSW3pKNisDfI7MCRmLIXEoK+7wxPBipvHeiD8xYZcVKrivC8iBJ0uQGnI
HvBickmNih4ionRZw2fd+Y0dTwAkreOIiC9WxBtUPs4E3EDdbuzKqeRYM3boNMLLGT0uEnbdLPHC
nQfUWoR4m2G5PZ5B/sRbJTiPQ6VtMpEowLM1WdDBD2RcduERu9mesNW17SWepS/A3q/eOoSbHXTG
MD1MHyV+wofl9PnzwD1gLG85VXH1Mhsi3c6ofBxaZdQDzjC4iTn1RWJ8SHmUjFKMzbVBK3PmVzqO
mMp6O1YYFbYgLDJmKHQ2byDT1GNC8AQ9rWBD7mQ4tOW6u1QTG2pUkW6hUwmvGOsW2LWNBBnH2QBP
QAqkwrptYtthhWKjHdArcDoU8weTvVNQdGcszdeVoETuhl7BVK+47NU/GZjhWptVvaWEeYTZ45Dv
lB2J2A+bOm+AFShXT36rkf/IBcs5gzOYN/JwI8RpFFY8I8QZdlS6oL+qKZZpRoaOAb2gM5ghL+o4
NQCxiG2x4kvREASd4xy4Ie8kI4kSjrJ0C1v7mh6A7qYgkyLh9IB97BtbiCAZdLQDmc44OAdBnNfa
T1CoCsIQUe0SVv8tguTgqdkfmiQxZtNWbWogl7Ig6nAfyzZq3GCxb9To+rvOTRqB1SLY/2UuJe60
fDcsGpE+XbKYw3TsFZ/SW4L5wKhiTcgMRg242N2JBmvMEhyhpKjcclQQwd48fFVzFMf1aheRB3Cj
xMsNbvq2xm6YWOjqvS3d9j/7ZpizW4xdJnIc+914Yns2Q1pIpKMyTVfB/GgPQpDGzMR7wx08xwxu
I6V9SzFvZ+pEGYzKBObXxITSOVPe/KE9/7MaM9UYeXTGAMIZyTfGBuAGvKj77JPb9DgmC0hG8VsB
xMTX7ZVO3XRdIFUUmKMOkzXUj3Y5Iuo83cRBxduGS0nUeuii6/TlPQypWCy2S7A/n13ZJq6zgOE1
4aLGYng1Rrb8LdCBh6bjIE8k5EnRa3VMDGu+bzZtDuxpzuByrVy/ctQInvd8t4Zy2NUGt/LwyuyV
oCUmSPO0AG9wJThv6mOVSUyeZg1XDVgr/vXHZrWcqBKa2etnMl81QzHgFGPKZWRMlg6GjC/7CZwb
DPmGWthskIi1L+a9YP4lEZRsHo3YxpIT9tQ1BVRwEuld3SV6jIy6zVRhGEs7raoDADGUb+GePB16
jrDA+Trd3YvhTgFi169HaUJE26QdzPsRTBTxXHmSCAQUXFe6/9gKzDHz+wSTXd4aNfKKawWNaiSu
NHZRRd9qLtlaklxqUSjoDLeLaMxhtqRrzRbG5DMqRNY5rLbgUpCfuhUCx7z7HHM+llPjHJmI6H5J
DKCby3TntYP5eyhBnTsSZdbKHo54ITxOeDcAgUTsa/zneaT9yBvJxwsBj9W5Wv04hTm8Op2z+sRk
mTyl33HHMOlyoMtiolSy6XBtV6Nvup4aPgZCn8t1afgR+4EgAq0/ubyFQ4tNx0jvZCER5rbNctFG
+tepguVfT5yY5zP7KotHRIY53mrgLcfMe8ve/sUxTmSxirZLdkcX4+nqLjoW9G33ZEeSYbTDnsSU
bpO+6edmTOfKZzThpv4D+DiWISP/emBOgnmQ6RDLm1R0iOVtM6ivDipl2kYacJSiVfNgBDtCMFqS
gTdxPT+pkCujFFTRLL97/pxXsFZFHHk4wdbJeQRwtZUMUdqCPWlnCXxSlF56qmSMudKwcbPCPXFI
gCFJunSQ0OQl2wXxMwpdCHOdeGON4Gs/ZwpY4l/eq5SEbXDdAe1P5l/Y445uxkpAJOGGs39pj0W+
VBgL5XOyq2wZs+Rt3c+xVKbZ3wfmOh7g4O7/lHhnYL6bm7P9mOBj5qQfILkgZ6gYJS8trFMoh4Kb
qu5s4THXRZt1Hcw5ePZTd3c6qm/rEDt6hVGUZQ52tZmHSSxkPjxBR6bHQMl+RB5Y5xuYAE78d+x7
ua004ouCxVdANror12OrlaiotRhm22tncnPBksp2Xc84TfM3cL2U8L2vCx/XK6UMRyKcRk/GTp9r
3N8mHWOqZZYHoVCdTBfGyQ3hZa6YJKjXMLM1hkrbQ0MSjjm8t4L3Df2hR2MUA8trcOKu6StGYQLT
cgsuRhGBs3oqmVosxyGdCJH8YZhdMznlQff9lgNHTx0h3/X4tco+55+BA9IoPgGJm9n4+7QAqteC
1RojHuXgss/TEJqLLTwRdp30KFY61sUTrEfEWeJOTC5/OjeOOV+rXgHFKpmufDNpNFNSkgTs9k3s
vGvXjxfo9TOUzRtjKqpnM87UfnbuoyviZKfqRNn67w5W1DlJTZm8o7P2qGZWMkXvKRDnX6TpHCOw
HpFtcA4SHBu7kVJ3UDDI8Xgrml2ohlNOxMZQN4Kl+Pr8IP4sjLJROEaKlmAVeRmZEDcosGppLBJa
txH/guBBxICQ9YUoCU9Ev/uW5W9AW7u85HOXZxMD6NTz351X1SpKOM8y4KWzCzWMwoc+FlwizQZx
Vy4AuyEIDwElStbpxg0oWbhFjMyBBg6oh7/8CVT1Via4XsNfgfppyFMhN9RtTzDD/Xw381TvIUHc
RzY3hZXOUmf005wojT8no9e2+VaTAV2AvpW9wMUWP3IEHCLgcVQEbtkYoGql8dJYt3p9/0WPN82F
bzS3nF/yetFQxcVFNl0HC96+3m1jBXqQGFpHmNq5Hk5NJuDMNxm0ywtKsI3dQcU5DdyHTx5yFPOX
+m13l7D96OgVTyTNkE0duGfpW+WgVV+LrK/nBxEuF/bkDOzGZoov3WaAhgSvIr38BqEYI4IwVc+4
7kDKsxMDqweSFFgsbecC83+vbVQOv72nh8EtGZUpjQnuDS560XNk91V8EJ1FrONAfWzzPqNbWvEN
zJN4yUm3mmKPMdMERTh/ukca3oYtkrLdPHXm4X+3fnMfH0oiOrws7Vir+VeyuF23XxtAV0f4roSw
D+57ozWRAkPTI335MaGEJ0EoF2/vy3tcQBO945mKYqivIgjjttADnx3dmsaSfdJFZ2PGKBGiTmAW
yyV530wJeLGNY5B6K+b3SPpA2lpsQkmDWNWrwc02GFPQFEEcwaMKAdDlisyteRGEI0S20RLqnw+E
oDwT7u3Bkbm2ew9OwmvbEn7CRd43grsthGct7iIZg8uxRHgGKmAevrXndqzqYdcbDUgy7XT8/cjn
8kHQuMk5p2BpQNzksk/Uc80HZ1HxZDPYtMRI2czc2ZNRL+jETfZ7ybBoCNcD0IERiD8l0hE4Wd1S
TFEFbecoPTopkLbC2mKNVV29JN90Gy6F2DaR0Ch9gBc9bVt7mm0FIwp1G3CiDTBsO9S6t+FaRV+c
Y9uwDWcMw2sLAv4GD5f2XBFCBXvJlj0UTtKpu+EEOlDskg7pDeETFqXAPHrvwp58yjY1eqRFrGWI
WXk/OwnsuL7t/utCjm0sSbKNhqqOYM2CLkTXXr+OzMQdq9GCR8K2BU774g12Kx5FFCLPTZ9qZQil
7HqoZy2QUOPJImlZsxbovYAWK3pJENhdxpuPQzxv1RXcsM1yAM7upNDQ0kvNzRniocM04rAo7OU7
oYC7+bklMSvmxadFcmaLIxJ3KEu/SS1iY8uqiItq2AGTUS+0GA2DBcm2K2NbUVUP+h6H8FnFxG6K
g0UinBieaKA4JLQ4Fu6gwr5DlKHVfUufaARRV8+QRiJEPPMXZqVHelCf9eKl0PD/xRviG8vW6ayk
uNh/XI/kqVuDx2zyNrBpYECRS1hXgoCz3j1XO0jNKJWv0P674Kk/RiVjjGWZDTs7OthnnDqJEzCT
nkEtg72lxoxtAE2wCfEM446zxmA+QhHfADEfg6ZPln2VdBQJtISp7FBuhDu4ytaP1uvtplsCR68F
fOrMHcbRpn3PsUCbz9gB3rNuOlAAlCDctU/3JEmZY99cvaeKSI7jHEoiAYeSR5Q8ZZQAEz6vWh2f
ESP2tNZNB5oglr1iqFANkIgnkGTM3NU2w+Quu2BiIrkqxlrpyZycHyw8a1+7Dg5ltgWJKeWt2eMO
CkFB2WqD9TEiyap6MP8MiEQu6gaO5/b078tbppc7jrKCSB1DJzxOnVSnlgyecm6zeG5YsSCJhtZD
+vzfiWdlaiRqwWKm5T25xGGYa0mEcCa7IZ8LzG+vW7aZ4J3gSOfwWmnK48/Mm3nhQLM1S9kSCyay
KNVrGHq/YvgbEirrthxxY4O+VO0S5rkIwDNPZ8F9BioeGIfzpX+8gkf7GrSNkUiWFEUYvfc7YPei
q9H1p14SnkQdlRUSERw1h9Lfudw/cSV77JBXwmuOydM2b8rrEhpbC53dVQwdGOzgT0PiiPJsA85C
8reTCEtkQRQiYEgajMARQj1ogyGGsrKmu4h9mRGbuOKMc7MzF3X0w9Ab3R2hrKV3DeE8Bz597TYw
gTo6gzfjAdxaJQbdgT2zV40TghO29vVzA+HiidTqGkg/Nrv2cuYlkFhDj+GqnEZvpbTdbl/d+Plj
1hOhKVHDnLCpzxbcCzIneHGwNep2F6nsaUZk1hfC94j43dBhg/XVA1nP7h47PTvxOr+xiEn/mzkj
PALLe2MvZZt3WFbZPRnA5yvxjxraJkiAE4uCK3vypfZA1BhY0LXj5LO/dbJ3nHi3jQnHnoR6uLFy
EKyEO5j0qFWXXILTavw7jD4V10N6HCDFlrAkGG/sdH96d/5D+r6TSaT5Ftz5CcqkfdlSQwNJNsyZ
oeIDMwH/67ImCCfW2/DW8OWDmwln/oXtrB6itjvE/WUsWsRuhnhtjFcGNS79KUU+D/zYDgDD2wF4
3ymk+IwsnS1KQwF6n2OIUjnDD3GZ8Hua4utBgxqLbGsMR11WL/dmJQYHf6usY5xSZVs8AF3pxHcl
2HMlxymtGwYdpujzD/pRUtkVYj8/7X7VMloPriCyTQaQjDNgroI3DQJ7vaUHqx4R2QIrHy4ricMj
s9rSXNcYaV6mxjy5q1fbB7xpZ9YRAb9yr/D3X4zB7EaCjgHW/i7VQm9TCp9BKUHJHLIzibUzNRSH
SN+l+LIHztRCeauWs82w2wlz81SAp9rYNkciBKoBfL46/2uN/tz1fKvzUvwTt5WQPnjNqYLnwoaI
DDFXaozzdBCpOSzkwD3euhB4KbKqYpjBMoxCb+gOKh5WvaTS17Nyni70YJZGcsZxeheEXhx/Pvnq
0Mfs7q1mAzFc9w0o1DuTQmX7XAwMT15KwECufKWCyAhYsxPiGE/JTpaJhiBg/k/oET2FaAZUFgRj
9fbSQ1vJeodSfXLPvNNSYVsGSIolvLnIJaThN3TVeRQYtP7KL/Yd4KsyRnDavUOLZX2d1QK1ELEg
nwmwP7tfa/uYfN8J1DILNBLk6QGyNwN8JttK84Rft+t1/TLfBP6wZ/J7akdNyd7+CUZ4G8Oga2gH
//oY9TTGc9b3dTjxCwO7Ppm/PrjuYzw/C69//AdYzjyA8CrE0HBdnNAEjkVDz+Ppzz72UDfSBsNn
nXsdb/tsLWCJZkw9C/haw9nMeCyOjapgCTn+47mNw2lrqCAyYhMzWG+ukCbByM3HsZ0GzMFf60YM
sHSvgHJ1tQlZVojwIdoLfEc5Nook9N5Sogl+clqOPap67IeTbdJ74MKpEtc7BJnETG9acJm8n8Dd
ihm1S8wp8k0L6w+fsImX8Jzh6FEyBrULKpEi66JP57f+u8q78XWciivEcUFbaAvQi+Uv+DLQ6bxA
FBUMvD67GgXPbsC/I2rg3R2o4coJ6avfstnr8JSM8NquuLeu35jKrP+WupPx0p033TaZxAypJ+iD
nvDDdGWP2f9h7tlHaH2vYhIs4RrG3x/5k5tW1Kt1NGgay5c2wgIVBnr2CwXrx4C9EJuGmoLzsZOQ
kMCRskbse/SELxODGLk4didNgXkYFK0v2jKczu45upJK2lnNe3EO68UYmGUFnC5zzcn0I06uWCLA
DQYF968O7H95mWgSlOx6RyhGJML4enjGo8HK+U41w6J/64ccOEnUP0PajfRNB0hz4ADpq/mrp7U9
ZNxRGrNdFWFyZzHghWT2uMB3FeUyzeGN0AN9BtgXjwM8l5LHqnuFGnXe/iJe17q1IdB6gA1K4cx7
ZFi+5FV+wWkaty91XmUV54KoMbvkW67zkDfpOqP3hbI92cyfGzqNE7pHt33X0PgTe5os1dmie3vP
YdJOeK/bk4y3ZkotUcxfVZTqV5gKCJai+zpsLwXCaVfPqQwI6TFP95wsETEaM4kwAU7WCyTcOKDd
IGBuW9FsCjACpqGLcfFSY/tBbsdGDkk2fEsSf5BQG9tD5PUdyawY7nIJ3wz3jx8wnj+Gn99rrfnX
r9uXWFCxWla5HUAHkzKXjQj5LcIc+y7ZspIWFrwLXg11+2Kv3wRPYhw58fTgrXiUs/Usuv0ZRyMn
NjSP4EYO9hpmLLA4liR9nrH4uenaJHPRAS0zGMYbbR3avo5JgkmXTbOwHn7++ZfH/wdQSwMEFAAC
AAgA20EnW9tfk0xtPgAA57IBABgAAAB4bC93b3Jrc2hlZXRzL3NoZWV0MS54bWyNnd2SHEeSnV8F
hnsNKuM/aSTXthq2pjXThUxrJl1jyOYQNiRBAZiZfTdd6JH0CuoCQJQf/9x74mamCD/lkV3pdTLS
84uo//d//u+3//Kfv/7y4u+P7z+8fffbdy+PP11evnj87Yd3P7797S/fvfzbx5/+y3r5L99/+493
7//64efHx48vnuS/ffjm/Xcvf/748fdvXr368MPPj7+++fCnd78//vYU++nd+1/ffHz6z/d/efXu
p5/e/vD4+t0Pf/v18bePr8rlMl69f/zlzcenoT78/Pb3Dy8/Z9vJ9eH3949vfvx0CL/+8jnVr2/e
/vby+28//dv/fPv4jw/m9YuPb/78H4+/PP7w8fHHp7/q5YvbH/Dnd+/+egv++9M/Pf2ZH9/9/t8e
f/r48PjLL9+9/Nfzct6SfXrP0/G9ePP0f39//CN4jJcvPvzv948//fEfr77/9tXX0ezrP47i3z4d
/H9//+LHx5/e/O2Xj//j3T/+6+Pbv/z88elw+qf3//Dulw+f/vfFr29/+3SQv775z88H+/bHjz9/
97L2P7XS53r54s+PHz7+29uPn4I//O3Dx3e//q/PkuOPTJ9zlC85ytccpe+/u355d72/u/6pz0s9
/mmOV5//mE9/+es3H998/+37d/948f4Wfhrg9uJfn4QfPsmfknx4+te/f3/59tXfb2/9orhScaji
gYqiitdfFbeDejqGrwfy9JHcPvu6/vT0kfxxTOWTuph81R3TZ0U1iuaOiTm6O6avCn9M9euBVCQZ
7kComO5AqFjuQGp2IO3rgTQkOd2BUHG4E/lAiT+Slh3J/dx0juPK4RpIXD08BBJ3il/37FjG12MZ
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
20EnW2wJYUH5OwAA8kQBABQAAAAAAAAAAAAAAAAA8gsAAHhsL3NoYXJlZFN0cmluZ3MueG1sUEsB
AhQAFAACAAgA20EnW9tfk0xtPgAA57IBABgAAAAAAAAAAAAAAAAAHUgAAHhsL3dvcmtzaGVldHMv
c2hlZXQxLnhtbFBLAQIUABQAAgAIANtBJ1tIzA3y4QAAAD8CAAALAAAAAAAAAAAAAAAAAMCGAABf
cmVscy8ucmVsc1BLAQIUABQAAgAIANtBJ1vgkxW6XQEAAP4EAAATAAAAAAAAAAAAAAAAAMqHAABb
Q29udGVudF9UeXBlc10ueG1sUEsBAhQAFAACAAgA20EnW1zFTaXhAAAArgIAABoAAAAAAAAAAAAA
AAAAWIkAAHhsL19yZWxzL3dvcmtib29rLnhtbC5yZWxzUEsBAhQAFAACAAgA20EnW83UpPKwAAAA
MwEAACMAAAAAAAAAAAAAAAAAcYoAAHhsL3dvcmtzaGVldHMvX3JlbHMvc2hlZXQxLnhtbC5yZWxz
UEsBAhQAFAACAAgA20EnW8/gR7SXAQAALBUAACcAAAAAAAAAAAAAAAAAYosAAHhsL3ByaW50ZXJT
ZXR0aW5ncy9wcmludGVyU2V0dGluZ3MxLmJpblBLBQYAAAAADAAMACYDAAA+jQAAAAA=

--_006_MRYP264MB6446141EA668A83766FD959380832MRYP264MB6446FRAP_--
