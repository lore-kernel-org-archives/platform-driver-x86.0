Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424D3C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Oct 2021 13:54:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 289086124D
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Oct 2021 13:54:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239009AbhJDN40 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Oct 2021 09:56:26 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:3478 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235787AbhJDN4G (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Oct 2021 09:56:06 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194DTBut010779;
        Mon, 4 Oct 2021 13:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=c6vn+NZjIbyrVZ6MIA8zzBTzIPCxSA6IV1+Bq6Kur8o=;
 b=H0GP7mUd/kIBcTc24U0WVWcOYd5jDblAM06YD5nPqsDct4qQ+6ic8mwW76vmpoCcdqjH
 Zf7tLyIFHBGj7gm3d0FpIPvyCsXVI9LPmHCb72DDgllVgzJVmpTUc8Z9GjJSIMHrTVqy
 WYWgun2GbhbF2CD1uOynVIQQprU6deiCgAQfXCu16E6qb62+7p+OS1CMbNwMDiGX8P7o
 6mKaBXDDqTxQ5Mr9CvqOQfhoom3FjVKMi8WR6VLgkyegATiI0z1TV3VxnHiTl5F8TXsQ
 rGVLsnpubcb9P5EetKxV67zgw6BoDv21FjleavxGxsDnvks55qpqyAu20BMJm0iE22RE Gw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bfaskve9p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 Oct 2021 13:54:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 194DnswN017944;
        Mon, 4 Oct 2021 13:54:00 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
        by aserp3030.oracle.com with ESMTP id 3bev7rpr9c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 Oct 2021 13:54:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YafsAEnwV11zNbkdhOdudVOVW81QyezT1cjQiu/37nNrcnydggNoTA2YPW3LTV0kT7GqccgD/SXZfZeTAYoGjKQYmdzV6Bnt52ZPV6TLZBM8O1iyXsDS4m0sPrZH+92oewkPmU4yyodu/+3GOmpOVLFmFDpEYBdY9V2dpNG3lLryuaD1bfKVFLtB4Y45plsP6fe/4MGIFh4W7yBa1RaimVHYmHS+x5WJ8eaenwbELpL/jpGPx2vBjn3DfsCsuYonj9bI92Pv/JQ0jiv26LWxluKYrjpKSlaQ97XI9zL9CW35WM4NRgztFB/VjQzorvhQogEONjdfK2RJsg+Iu1mTrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6vn+NZjIbyrVZ6MIA8zzBTzIPCxSA6IV1+Bq6Kur8o=;
 b=YYO/nScv3/jZl4ZQnbFQlfuEJNtu+cFsdWraKzcpI++vop8JCPMNuIYAzJANGf1rq9uSMhUmGUQdSIBm8RktuHil0V2WXLxkTpFbd/Qrgy8pCphyl3odeMDGzdynU5DHq1sf8xMUUNm1kkAeC5WqubzImFAqaBnKIM93c6lJpLO1aiTVDBMZC1FWtqnNGFKDEeEOy/B3ZpEkWk/UjT1O7wnYlH/tzJMi+dGojNPeewPm/f8t4pZGGFDSZS8EWHN/01/T76+/Iqz4GMO1DOBeaWzUEnShakuvAE6EqJswSz8uVDtd4cTqXqgucnAviADPpbh9I1LSse/Xc+16FYgHoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6vn+NZjIbyrVZ6MIA8zzBTzIPCxSA6IV1+Bq6Kur8o=;
 b=cW4qxl88uh9XTW8KZ+IF01ld+3nirr8JahRncikQVQZq809XdF7HYkiYl6I8yReAJaj4CNvohq24QKPBWecXhdlAcNRSuvh9SEpINVoTiQoAez9L3bcoaw08AgPor0/JAlzegTu/KsTXLV8/JbJHSjE1gAT0K5IdIuXz1X2LFa0=
Authentication-Results: v3.sk; dkim=none (message not signed)
 header.d=none;v3.sk; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4434.namprd10.prod.outlook.com
 (2603:10b6:303:9a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Mon, 4 Oct
 2021 13:53:58 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 13:53:58 +0000
Date:   Mon, 4 Oct 2021 16:53:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     lkundrak@v3.sk
Cc:     platform-driver-x86@vger.kernel.org
Subject: [bug report] Platform: OLPC: Add XO-1.75 EC driver
Message-ID: <20211004135348.GA12255@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0156.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::6) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0156.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22 via Frontend Transport; Mon, 4 Oct 2021 13:53:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f5742dc-6726-4e51-ea76-08d9873e69f2
X-MS-TrafficTypeDiagnostic: CO1PR10MB4434:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4434F4D36B41622559831DA68EAE9@CO1PR10MB4434.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N9lzV4SMfmINpwh2lEiuV/t7CbKzSbNsCZfcMmwODVLo+Ek4iPU6NC5zAtmLm2TwYr+WwgmOpM/CDTNYjnrBFyYSqPdUN1MfQzdU7qmo27xqqaBC7jW66uVdcL/n4FuP64phsQ5tdxIL49wl9itI9BQKaVXpPwvp+7gCvryEnf9Y4gl4OeB2NdSQVxVk9YEbUeoTxKuGme9H+yODXwKa+1j9KYUNuaU09Nvk19jwutbPBd+eAjrwqug8TK2FZXAD1TdB391rKmmu0KrJvbNSMeW+F8J6JJyo1FobWGiHXbdYClSUTfFrthBezSpzsuie0k3LcN3jtCjmhsTI0M4u33yyu16IuxeCHHipETDPdpbRi5PW6UErIQ22eE2+syeOW50FdSj5Adf/t35304eKh9qigQGHtt9GyfLAJuTo4xXUCJASsvCGobCJC9y6B5/qxx8KyuR0DJC/VqdXBUAkNsYZNJC6t34us4kdVONQtaAFjn5lO3MIJhTiIYs6VTkt9nVyg9bYtarlryBmIbrstYEllawB/yzeArcNeW9wj2/eQ5DBhqa9zyLU/t38EOqnsXFED2N6tclQHS/0XRETD0Jo/WdzEg8dppfcp9E02te/oNfV3NjMl7qm1EmWrZq68xovTAOQhR5CO18cplJy9CKmZsSn5h55svyHd43tQxkzETIWvfYiITSXylpmEblA3kRVTJ0p93Ebnh942pgPfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(44832011)(26005)(9576002)(6916009)(86362001)(186003)(956004)(66946007)(316002)(1076003)(66556008)(66476007)(33656002)(8676002)(2906002)(508600001)(33716001)(55016002)(83380400001)(5660300002)(52116002)(38100700002)(8936002)(38350700002)(9686003)(4326008)(6666004)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0AqwrDjkdUu6RTJNmEZqmu3rlhKPR//SrZr2YSNYtgGexTOGRuUbp02VODqO?=
 =?us-ascii?Q?64zA8ToQ2IB4dH9w64rV9emKQ6Z1WDkNj8sxw36oMoF6jqEb/sAPGjJrsggL?=
 =?us-ascii?Q?e34jDNCLbKm3ya6QBC7pJX84qyhATkBF24C+iUZ5zuVc7LH3ytAP7skaAGaN?=
 =?us-ascii?Q?UBahe9SZaCexQe9eVHzh6vyOaC8pmi6ogx7HcJuzUTzp974Ei7S7XWRvSOxU?=
 =?us-ascii?Q?n6c33OQfaQIjuRKQPIXEWBf3zPDL9WePZQ6ny67+uGXv/Q3DMPOEoepH1TCJ?=
 =?us-ascii?Q?/Y+GtuhbkJZfkVHyUys1kZth9+FjU2Pgi3z9gKi2hTuEN6oCND+ZidEQmIFD?=
 =?us-ascii?Q?5zwaSZPiihC7sAYl2FXXFHsbdRJQsS8THM0VYMZm/GYOSbX4/9/J4bSw3LsV?=
 =?us-ascii?Q?l0pkshzeBFFh4xZWK5Oe5LphC2uGJtziuvLjvqqVt6Qk2w3KI2D1psFaYPfi?=
 =?us-ascii?Q?lmc4bzktyeV8azF4f2NlOVcUK9U/S6h9ngybq1/+WgIw0m4Jd6lBGvCJ8f3u?=
 =?us-ascii?Q?1UMsc+GdxnD4j5Gaqxksk5NxPQR/lZPrzYoktnHlCej/4bguXN1I8Q0PpRRe?=
 =?us-ascii?Q?w7hlPctGN9TT1cArtt5Y7FMQHXZ36CSEBjiC4mKwkdBTJTmveiu7dE5B0SlK?=
 =?us-ascii?Q?RlAePywpZtaiJiFoNW6fGLj6YQOjuIbfSW7Eem+hfDik/cfIfX60TnnFqQ5S?=
 =?us-ascii?Q?2LG5+rNrP5BJRIzTLKmeEEP3Pf+FjehT8YTRN5vsWceuuj/zrukn6d2g/yaf?=
 =?us-ascii?Q?O5sB+zaFo7NsgkIvNJ5CxdMso5PACSLO3NBmOTfST7EbkPzR2caPw8tf+A3T?=
 =?us-ascii?Q?h2YDdqPnPP+GLbCevoThPrkdlv+lefTKSoLxEYcyHkj3RpvCIvPQ/3mK0Nx6?=
 =?us-ascii?Q?gsSV7JcfnB7naj6mDq25FkGs9xVaE1dpLhXVFzMnVtHscNIvocnpnjbE5QTI?=
 =?us-ascii?Q?wGLpLlqZZOBs3sUpmzWLkdIdMadeD4+UTdrFK+0CSMJ4k2bapzSwmLCa4An8?=
 =?us-ascii?Q?rpysRzGkAc+DXBupM2FMi4OthrnMxba9GuK2C2XwsB1DcQ5e2WOlSylGMSbc?=
 =?us-ascii?Q?uHnXCfwW7pTU+wX+BCEq+v2PZTvSI/xGu5SIFRZxuH837rXeSTh/fPmQ04/1?=
 =?us-ascii?Q?zMjX9CNsIokRvXEPZbqSqzUdJ67GrQ4S//JzywpA3QG0WaYtLohOFU5iUhFb?=
 =?us-ascii?Q?OX9Knuy1UmrtBDLQBlHNy7Dc6BV3ngnkTV7A3SbSYnWKbI9hlv6VRM3DeDIj?=
 =?us-ascii?Q?iW35nWrdj6rzJobiMM1lkDzqX/Tvu3ozAh6ur58C6cnj5NsiK1x6HrxvbN7L?=
 =?us-ascii?Q?SEBSQPJyG7vsZkNSsnIxLtkk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5742dc-6726-4e51-ea76-08d9873e69f2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 13:53:58.8233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trD2tuZkd3NmPvJsDJRLNFjkT0xkQFBfq5KZVIW2VbmLtS8BlzbIaUoaG4KYqYZMwKRoLfzcT7B6rQ2KyhDd3c9WUjsrJVgnj1JqzwA6zAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4434
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10126 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=798 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110040095
X-Proofpoint-ORIG-GUID: YW_oNWfQl8HldKVoVmlmUb79K5hagFSV
X-Proofpoint-GUID: YW_oNWfQl8HldKVoVmlmUb79K5hagFSV
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Lubomir Rintel,

The patch 0c3d931b3ab9: "Platform: OLPC: Add XO-1.75 EC driver" from
May 13, 2019, leads to the following Smatch static checker warning:

	drivers/platform/olpc/olpc-xo175-ec.c:363 olpc_xo175_ec_complete()
	warn: sleeping in atomic context

drivers/platform/olpc/olpc-xo175-ec.c
    350         case CHAN_SWITCH:
    351                 spin_lock_irqsave(&priv->cmd_state_lock, flags);
                        ^^^^^^^^^^^^^^^^^
Takes a spinlock

    352 
    353                 if (!priv->cmd_running) {
    354                         /* Just go with the flow */
    355                         dev_err(dev, "spurious SWITCH packet\n");
    356                         memset(&priv->cmd, 0, sizeof(priv->cmd));
    357                         priv->cmd.command = CMD_ECHO;
    358                 }
    359 
    360                 priv->cmd_state = CMD_STATE_CMD_IN_TX_FIFO;
    361 
    362                 /* Throw command into TxFIFO */
--> 363                 gpiod_set_value_cansleep(priv->gpio_cmd, 0);
                                        ^^^^^^^^
Can't sleep under spinlock.

    364                 olpc_xo175_ec_send_command(priv, &priv->cmd, sizeof(priv->cmd));
    365 
    366                 spin_unlock_irqrestore(&priv->cmd_state_lock, flags);
    367                 return;
    368 
    369         case CHAN_CMD_RESP:
    370                 spin_lock_irqsave(&priv->cmd_state_lock, flags);
    371 
    372                 if (!priv->cmd_running) {
    373                         dev_err(dev, "spurious response packet\n");

regards,
dan carpenter
