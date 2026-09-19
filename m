Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazolkn19012050.outbound.protection.outlook.com [52.103.2.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E256D3054C7;
	Sat, 19 Sep 2026 08:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.2.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789807312; cv=fail; b=p1pUBP68M2+Dhxohf4DgE2S/aJ2CJrT5o4pyzJmukp49hX0fHco2pBTbFA6da26hxueUr0MPZJB/lZQIQQ768G0nlKwQlmxK3tGe3qJdIuBXeGnhCAvUXac+FwNe7y/N6HHVo/rTtAsK3OTQ+/THKJq+HJcbOI97FiFZUY9CSlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789807312; c=relaxed/simple;
	bh=SwZRwh0Pif6ykx0iH610jiIuIzdB29JIN5gltIKjZEs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oNGnQDFRRk5Wi5KA52yw4OidpbJJxw8iqSj/+0MllX2YPBJQGLpE0t7S6/jk8rbK5uMoJSxZefZUuxxqqK449AZaiRKEPL1wFHEhPh/vFFmPBkLrDfIddgVnRygWIijH9oEMq3fFJ+BAIyzj0nVg49PoRE34Qgmhw3T8QZmeiZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=Y3+wmx8l; arc=fail smtp.client-ip=52.103.2.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="Y3+wmx8l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGTT+PI0poHzn6l9kwMDJ0kBJDXYAYHZ3AI/G7wRWJSpLCYjTO6uHWPPdzweYOpHyd7mikzYrwq5iRu45fTyzWdvZdQfeCX532zPR5j9eHpFTThG34X0eFt1/9wAgFYDtqpxC2YjAh+Th/IixcNlki7Yz1XdOIjQ+l+Ex5MfZakzyinjiBwXl66yxmnvTX+idpjQwJhja/dKAUtfbjogyuq6I5yAUfAckyBm5YduKJIrXEb/XeYsd5HfRBRcZLE1THZcdZp+hGPAVpjYci929rmuVV2VSHqR5Qxw9wHdqjhCVhj/jXj4Fmx5aTUf40fnBM1sWCmc7nuDSMs4xS9jmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KGXa/kJkbjRcUo2on0alYpeKIW/AABLQQ8Ovty9j7g=;
 b=ojxD+LY6cz7hP4UC/LGz/Vsg5d0B9Kvb5pO626S+tJ+U8wdYBLf29nqHhhuKUhhwOr+AA0IQT4XrBRTNcG2aRepQC6jHh8qYxPTZ4BUG/+jSHH6g9vVoPOHGnl3f81YUYTL14mGMR6iqp/9xYh3YJJM8EmD81C/XNyuUFTZfRW8XhTnNPpa6DV2LsCFakItZ0gl56cBarXavVBjUAB91E5I1Xm5xluMhar0HS7y91veVRa0gfA/TbpThrJKQZQxDNTlrYYs85JGdkYFsRLYaxeFP5IVhAiO5eYT0Vj4nF5uKwZ1HoPCINDuSeCdyP+HkewVpUclOjNtWv66CJ/rc2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KGXa/kJkbjRcUo2on0alYpeKIW/AABLQQ8Ovty9j7g=;
 b=Y3+wmx8lnWEXub+j5Bnw8bT/cMYtBb0KV6nihGV1xZnGzITKrJhpatUEhVrjXb7YxEBUFsQaCUW7Is5akayfoiD4VGXLfII0KXGZUDghRLMfjin7SRG1Cp5HZPzky3lHlsNG+OyVPWom+dlzZIR9XRQKgLpl0kkbNgx+C/3D4IzBLlfUmd3uzrmNqgN5p6jyMCEahiJCkb9gaCOZFYktFY4WX5ya2UBqA3G2uy+cMKLLCo5xIQflg/zEdfxEkLMTpwEOuNfW+TuI3Uby58tCcEXH+u4B7A/hp4nBC8GSAV9LMAI1Fj/mpKzRaYrMb/jcr6iJ0UYxQqfStJrcci3wJg==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by MN0PR19MB5850.namprd19.prod.outlook.com (2603:10b6:208:37a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Sat, 19 Sep
 2026 08:41:48 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%5]) with mapi id 15.21.0428.011; Sat, 19 Sep 2026
 08:41:48 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Hans de Goede <hansg@kernel.org>
Cc: Ike Panhc <ikepanhc@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Giunta <marco_giunta@outlook.it>
Subject: [PATCH] platform/x86: ideapad-laptop: Report camera switch as SW_CAMERA_LENS_COVER
Date: Sat, 19 Sep 2026 10:41:35 +0200
Message-ID:
 <SN6PR19MB23039910DD1918BEE3825BAFFC862@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1PEPF000008CE.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::42a) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20260919084135.36559-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|MN0PR19MB5850:EE_
X-MS-Office365-Filtering-Correlation-Id: d5350ee8-5093-4604-6662-08df1629d770
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayHq8QFbWW6Ra03gxaeZK6u4ni1jDADZfp76rC6lBIEK3v4tCYQbOHyT2QsWV0lJlNYnFUkDs3oywhxKs6gloMHgFK7nvsio9yDRETlhfyNYuzL/vFb/cRGd6BQPnu3Oo1hr3nkxvyTGKBK+0FeVR+oWUnOnv/TL/gCYZ+htNvhX5xeH4Cf68ZmftsvT3YOZphczb381GfuB+kk+9ZEi/YkeTvjHbcelK8JiJpolERWr0OwsYb9KtbgiZ1/bFP06pKgpKRDYT2EcrQvsCDH7CXXT1fUu9mDNyMiDpe3ds7+IuPNwbNcFFg2ee+t/Vwy1uR3ZCOQrm+u5ipKsR7SLdIzNovPi3aynP2Qi7PDcdBwJaCEcXjcO/gK6fpbBNZS8i86MjbXZoyHuNgjguU7DRSCru8dW9I8svSn3Z9a4g9K5QYVJr+2JGzX/05TjwM7QNKddjQrMC2YJgyCFseZB9w2k2nhjZQFsqm+d8Rb0Q40lm28oH04g7nxpYWN3juAEP7p5cqnTYdmXAgMbqt9wnG2qN1EYFJ8LyI9n1swZx1A6ma00RzoC/gPYQ6Ja+VaV3TUp0tZPTTvJAJcnjaru+vPYU+Q/91sAZqjzsEE6m4ijXLMe2xwDRJNhhwf/FZjtiR5NmwlKw9f97OdXmHdJfSUcd320Zfkb6Nq+mZ8tben6XRLLZvgu/U5XECeSlUlNkMwkkdD7LtyzONiq7okXue2vsOOVux1xSJQ=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|23021999003|5072599009|5062599005|24021099003|25010399006|19110799012|8060799015|55001999006|51005399006|41001999006|440099028|3412199025|12091999003|40105399003|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jtKHA0Vb7FFCmQ5QX3hoDRl1eVFCscL59AIVI5nU61vpAUFBipDk4Cu01bMV?=
 =?us-ascii?Q?Jd1UxIoXw/DDLpeAnzeV6o4iQZTKKiiXywPhvOVrnkzEBu4LYgdgA6w16W1h?=
 =?us-ascii?Q?OX3c9tQJU0MGXo84wPXNr436d04O1MeaooO4FceuWeOxXDwmZKfGmmSvGUgs?=
 =?us-ascii?Q?ajdzPtPxNIKKUxEMbYBIVKUsqm/40sntnmkog1KElY5ALIYW0d5no8rhsW1A?=
 =?us-ascii?Q?12tk1ucCVm9N0243OVOXqz2xaEVJ0NiB/FAye0RK/FZ4brMle+8wdd0M47vO?=
 =?us-ascii?Q?2rEtkQnMVuldrucHo4d45mG72LLjpr8nePLwqls2F50rxAGlI4ZJXJ3TmoY6?=
 =?us-ascii?Q?Zkosth6+xyPOxDi1vON0xMSwEq40r2rYCe8z1pzyo4Q4DzETgYffv6Jo5CFk?=
 =?us-ascii?Q?7Ds0PfFkU95kVZ50wC0QhwIk8uECGZPqayANHWD3CnI5tCvK4lEeZqkYA6jA?=
 =?us-ascii?Q?5iZhxS8ppvbyg2/zuKLxkTRYkRg5dVXK/oiTjD7EpzBV1Hu8ETwMfkZdRejl?=
 =?us-ascii?Q?NwV6hMD57YyI5Sfw3Gl5LEfAyZL51cO1bslYHthtoUBBY6WhqRjA40gpeJMH?=
 =?us-ascii?Q?MkGSi/YJXrKrNtUUj6AIuT3Z9QUXOYh9Pls7RUEzMw5VDQ7YgbnIxsCn9fQ8?=
 =?us-ascii?Q?3uG5evhOi4YGDk4q5Ls/Zr+R2IZG41k7lDTxZo0UUvl7pU3YPB5IkdfUEb3N?=
 =?us-ascii?Q?5UYChrHXLbpj1mJcSgeh2oGPsPrKWpbFjvuSoSa+K0o35du0YrmKRd0t9nXc?=
 =?us-ascii?Q?9tfseXgjn0Texbj4/jakqxoYSb3gBbiZc8AUuXS/jCH0W6HXJlVR7f0vZPU+?=
 =?us-ascii?Q?+8hPEF/xIAWTbCQteJErywFsNBxvEgS7KpAmLVEsVM/LkZ9yxgZmQ7e/mXLS?=
 =?us-ascii?Q?pC6aOEzx5vYvPwk3ekDfm3ClFXRaWHAowMHmSXFoNNAJ6BV2HObMXhAl8aeP?=
 =?us-ascii?Q?/UFiBEYscgJg2pxqsaGg/ULeBjJnv3oOPWegWRgaHLb/XZCRnJifpZ8iHqf1?=
 =?us-ascii?Q?8o/qgVT8kCJE/ZnGyISr2hmDb/l7h2EZM4j03xvqy/fJpydo+qbfqIh2qMXH?=
 =?us-ascii?Q?ZSOn61z1fX4px1uYGjJfiq9XK8o/FA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vyy6dbRa7p2S7bqNpuBl98X/UE1K7Cd/AfedhIpB+CU0VzmqSM/2dzd1nla/?=
 =?us-ascii?Q?0p6c1ZqVzcXg77Nv/s1yMkasIblVJwsqljgeJacNTX09VS5XVczua5Qaul9Z?=
 =?us-ascii?Q?nqO3iZBFjO1GQDNPFc7pKD3te/2WL/UHnDBpc94YT+nQCZJXIGF01TVQ/h5V?=
 =?us-ascii?Q?H17iqXGS/LWlXsxSnUUN4kbjqziLwvNPBIp/ovPT4S8aLCvo4HqPBZ0GKf5U?=
 =?us-ascii?Q?8FjDvIsi2euOn8H1uA6cexC6oA3jVX3T9ooErFDv8uqwGfiMltsJ9n2eFgJd?=
 =?us-ascii?Q?Vd/GyFp0F+oR+N5v9Wa0NQe1JyIN36sUUIvyIFQTaFjj9TFgUQGdMooZqd9K?=
 =?us-ascii?Q?iAgSgxqlseX21rz6NYGRfjCJ/Jf86qOXVQJrWbHl9C5kZKd8u6/UkW/ST/Vu?=
 =?us-ascii?Q?hTkCWUvwVSiZDKeqVpRfqaSLBOl+GykXsytg7B4jXthDDMEUvf+eQmHPHJKU?=
 =?us-ascii?Q?L1Rzwhj+1mgBf8+P3RJRTJA0bWi2HWnhONKr8FfEFkjZAavPkcUUYDnLbJoO?=
 =?us-ascii?Q?QU8AYGVy5UBYBrodweckEUwbkus8Tq2GyVVB3COMkSSIba4a8/2IoXvqmihZ?=
 =?us-ascii?Q?8dMpisAfp9qOXiuuwLVet+a54TQA1eWTwt/xCwB5V57F0St28MGsgMEQCVuz?=
 =?us-ascii?Q?hvpbawobgbmvBzaJT/xpnEc3H85y9e0IQ4+3rqpVcn7DHXbap1NLcaUo7T+Q?=
 =?us-ascii?Q?IAKPW1OagH8rwZlQPLowD8Lspt6RYib/LZRfzOt+151hovjKIJS/nsA29QHG?=
 =?us-ascii?Q?UBx1PUzaq+fMbHmANJs6OCCvfAwyNTwWVPvVuL+Gr5IhHHX6INoPS8mjFq3h?=
 =?us-ascii?Q?k9JAvPhprabSy6AMJGBUrBYnVvLWvCk1ztjFHPUexH+4zV+InRK0muYVGlSY?=
 =?us-ascii?Q?6ZXY1GV6vmEEXB6L2d9Q8uEpRQUdjbEZDNJkDcPxlLbCZtjC2WY6XbwOQPzV?=
 =?us-ascii?Q?NWL6l/jmyqK4rzXxL2Z7AJPijGZm89IxN9bP4bX3GtZWGQil6x6PksBuL/Pt?=
 =?us-ascii?Q?ygeGRko5chn/0dKBuAAqeHYXEpI586Wcl7FzC0kPnWw46OB1sYUqPXDuSp1E?=
 =?us-ascii?Q?NXfvD6vKsYhKk7y9e7hcqWIL0HGxfJUB0TYY5R1CTEpHAF92uyRd22p02sbb?=
 =?us-ascii?Q?r6iDv+qDyh0i2FHzREqTJGq9/DNObKFlP3sjqvXYiGoaMtaN7vyUw8u6jwIu?=
 =?us-ascii?Q?QrMgZf8LmgoVXYrxAYyiwFLBSzSPtYp0ZLY4Xvwl4AT4CuslObuRaoBcIPzI?=
 =?us-ascii?Q?+pqNkxIe3dSBM9hk0wwf7+hVOha7XJs5prVulQiQBwL2gz4nTvH6GhvCPNrj?=
 =?us-ascii?Q?CjLl7azPBOhP1OLhS6FvedhA/hQmTNtOyd3tvXeVxDNVv9VsG/oZfWO1uPq5?=
 =?us-ascii?Q?92OwoFhHeLWKbaIkA3M6eQ3rwaDP?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d5350ee8-5093-4604-6662-08df1629d770
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 08:41:48.1694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB5850

On certain 2025 Lenovo laptops, such as the Yoga Pro 7 14ASP10 and Legion
Pro 7 16AFR10H, a switch on the side disables the camera. This is handled
by the firmware, which also sends event 0x0d (camera disabled) or 0x0c
(camera enabled) through the WMI event GUID handled with
ideapad_wmi_context_fn_keys. These events are currently reported as
KEY_UNKNOWN.

Other Lenovo laptops expose a similar camera switch through a separate WMI
GUID, which lenovo-wmi-camera reports as SW_CAMERA_LENS_COVER since
commit d98bf6a6ed61 ("platform/x86: lenovo-wmi-camera: Use
SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS"). That driver does not
bind on these laptops, so do the same here: as the switch state cannot be
read from the firmware, register a separate input device with the switch
on the first event, and report the state carried by each event.

Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
Notes:

* I considered a couple of alternatives to the approach in this patch:

  1.  Simply map 0x0c and 0x0d to KEY_CAMERA_ACCESS_ENABLE/DISABLE:

      { KE_KEY,	0x0c | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS_ENABLE } },
      { KE_KEY,	0x0d | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS_DISABLE } },

      similar to the touchpad off/on hkey events (66/67) this driver emits
      after the firmware has toggled the touchpad state. However, HUTRR72
      describes these hkey events as asserting a camera access state for
      the host to apply, rather than reporting one the firmware has
      already applied. Furthermore, lenovo-wmi-camera moved away from
      these hkey events in favor of SW_CAMERA_LENS_COVER in the quoted
      commit, which is arguably the closest relevant precedent.
    
  2.  Ignore these events like the firmware-handled FnLock events:

				{ KE_IGNORE,	0x0c | IDEAPAD_WMI_KEY },
				{ KE_IGNORE,	0x0d | IDEAPAD_WMI_KEY },

      This fixes the KEY_UNKNOWN issue, but userspace gets no information.
    
  Overall, in the end I copied the approach of the lenovo-wmi-camera
  driver. Kindly let me know if there are other/better solutions.
    
* Unlike the touchpad, whose state this driver reads with VPCCMD_R_TOUCHPAD
  at probe, on resume and on each event, the camera switch state is only
  available in EC-private fields, and the two tested laptops even use
  different ones. Hence the lenovo-wmi-camera approach: the switch appears
  on the first event, and a change made while suspended is not reported,
  leaving the state wrong until the switch is toggled again.

* For reference, on KDE Plasma 6.7.5, using the Legion's touchpad toggle
  button shows an OSD, but nothing on a SW_CAMERA_LENS_COVER change or if
  sending KEY_CAMERA_ACCESS_ENABLE/DISABLE events. I am not sure whether
  this is simply a case of "not implemented yet" or if I misunderstood how
  these events are supposed to be used to communicate with userspace.
  Please feel free to correct me here.
  
Best regards,
Marco
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 56 ++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 207368f5d489..c354b5d71399 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -178,6 +178,7 @@ struct ideapad_private {
 	struct ideapad_rfk_priv rfk_priv[IDEAPAD_RFKILL_DEV_NUM];
 	struct platform_device *platform_device;
 	struct input_dev *inputdev;
+	struct input_dev *camera_switch_idev;
 	struct backlight_device *blightdev;
 	struct ideapad_dytc_priv *dytc;
 	struct dentry *debug;
@@ -1410,10 +1411,43 @@ static int ideapad_input_init(struct ideapad_private *priv)
 	return err;
 }
 
+static int ideapad_camera_switch_init(struct ideapad_private *priv, bool covered)
+{
+	struct input_dev *idev;
+	int err;
+
+	idev = input_allocate_device();
+	if (!idev)
+		return -ENOMEM;
+
+	idev->name = "Ideapad Camera Switch";
+	idev->phys = "ideapad/input1";
+	idev->id.bustype = BUS_HOST;
+	idev->dev.parent = &priv->platform_device->dev;
+
+	input_set_capability(idev, EV_SW, SW_CAMERA_LENS_COVER);
+	input_report_switch(idev, SW_CAMERA_LENS_COVER, covered);
+	input_sync(idev);
+
+	err = input_register_device(idev);
+	if (err) {
+		input_free_device(idev);
+		return err;
+	}
+
+	priv->camera_switch_idev = idev;
+	return 0;
+}
+
 static void ideapad_input_exit(struct ideapad_private *priv)
 {
 	input_unregister_device(priv->inputdev);
 	priv->inputdev = NULL;
+
+	if (priv->camera_switch_idev) {
+		input_unregister_device(priv->camera_switch_idev);
+		priv->camera_switch_idev = NULL;
+	}
 }
 
 static void ideapad_input_report(struct ideapad_private *priv,
@@ -1422,6 +1456,19 @@ static void ideapad_input_report(struct ideapad_private *priv,
 	sparse_keymap_report_event(priv->inputdev, scancode, 1, true);
 }
 
+static void ideapad_camera_switch_report(struct ideapad_private *priv, bool covered)
+{
+	if (!priv->camera_switch_idev) {
+		if (ideapad_camera_switch_init(priv, covered))
+			dev_warn(&priv->platform_device->dev,
+				 "Failed to register camera switch input device\n");
+		return;
+	}
+
+	input_report_switch(priv->camera_switch_idev, SW_CAMERA_LENS_COVER, covered);
+	input_sync(priv->camera_switch_idev);
+}
+
 static void ideapad_input_novokey(struct ideapad_private *priv)
 {
 	unsigned long long_pressed;
@@ -2312,6 +2359,15 @@ static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
 			break;
 		}
 
+		/*
+		 * Camera switch, handled by the firmware:
+		 * 0x0c camera enabled, 0x0d camera disabled
+		 */
+		if (data->integer.value == 0x0c || data->integer.value == 0x0d) {
+			ideapad_camera_switch_report(priv, data->integer.value == 0x0d);
+			break;
+		}
+
 		/* 0x02 FnLock, 0x03 Esc */
 		if (data->integer.value == 0x02 || data->integer.value == 0x03)
 			ideapad_fn_lock_led_notify(priv, data->integer.value == 0x02);

base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
-- 
2.55.0

