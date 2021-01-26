Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,BIGNUM_EMAILS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990F3C433E6
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 10:12:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52FF223108
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 10:12:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403855AbhAZKMi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Jan 2021 05:12:38 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:48602 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403808AbhAZKM0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Jan 2021 05:12:26 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10QA4gmd008256;
        Tue, 26 Jan 2021 10:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=0n2HYpn7oLE6scNo0rM9sdfBR8KVIYBrxoIp7PQr6Ho=;
 b=f1ryQwnxiK5F2wbTybtFV97AsxN6ow9lcDqHotGs9ClflrgpfhPHprN42mubh+LKyO7+
 qE6/wfsfOZR0Ux166d+05DGsPrnJUP6hx5P8OhpB4/3iYqQVFkmYJImBUrwXbxWJgilE
 gtyYmMyRuTF1CPJvze6b+9/0mrEIPve9WxJ7d9xcHrRusee0pjk2ne+cGnwWtay23+l3
 QKgsmi2QvvHq5o3b2DOe3JE2YFH8bWmwRdgNZw9h3KiJ70wCBmoBe9vfYLTP3+xBE0Ox
 La8iLQ24Fjjlr7b6ewmdJl+QgCsfJqiGkfHfowOW5wZEIVX9lhVvp3ItCRYnAvJx1UK0 kQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 368brkhc1j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Jan 2021 10:11:43 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10QA6UMP188320;
        Tue, 26 Jan 2021 10:11:40 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 368wpxr9bb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Jan 2021 10:11:40 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10QABekv020395;
        Tue, 26 Jan 2021 10:11:40 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 26 Jan 2021 02:11:39 -0800
Date:   Tue, 26 Jan 2021 13:11:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org
Subject: Re: [bug report] platform/surface: Add Surface Aggregator subsystem
Message-ID: <20210126101133.GP20820@kadam>
References: <YA6up/PbuEZ82kNd@mwanda>
 <9302e8c9-5909-968c-9ac4-e5725e61082e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9302e8c9-5909-968c-9ac4-e5725e61082e@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9875 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101260052
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9875 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101260052
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jan 25, 2021 at 01:12:06PM +0100, Maximilian Luz wrote:
> On 1/25/21 12:42 PM, Dan Carpenter wrote:
> > Hello Maximilian Luz,
> > 
> > The patch c167b9c7e3d6: "platform/surface: Add Surface Aggregator
> > subsystem" from Dec 21, 2020, leads to the following static checker
> > warning:
> > 
> > 	drivers/platform/surface/aggregator/ssh_packet_layer.c:1697 ssh_ptl_rx_eval()
> > 	warn: check likely/unlikely parens
> > 
> > drivers/platform/surface/aggregator/ssh_packet_layer.c
> >    1683  static size_t ssh_ptl_rx_eval(struct ssh_ptl *ptl, struct ssam_span *source)
> >    1684  {
> >    1685          struct ssh_frame *frame;
> >    1686          struct ssam_span payload;
> >    1687          struct ssam_span aligned;
> >    1688          bool syn_found;
> >    1689          int status;
> >    1690
> >    1691          /* Error injection: Modify data to simulate corrupt SYN bytes. */
> >    1692          ssh_ptl_rx_inject_invalid_syn(ptl, source);
> >    1693
> >    1694          /* Find SYN. */
> >    1695          syn_found = sshp_find_syn(source, &aligned);
> >    1696
> >    1697          if (unlikely(aligned.ptr - source->ptr) > 0) {
> > 
> > The unlikely() macro returns 0/1.  Smatch is suggesting that this should
> > just be "if (unlikely((aligned.ptr - source->ptr) > 0)) {" but I'm not
> > at all sure that that's correct.  Isn't aligned being higher than source
> > the normal case?
> 
> Hi,
> 
> the suggestion by Smatch, i.e.
> 
>     if (unlikely((aligned.ptr - source->ptr) > 0)
> 
> should be correct. The normal case is aligned.ptr equal to source->ptr.
> 
> Let me elaborate a bit for detail: SSH messages all start with a "SYN"
> sequence and are frame based. So once we've parsed one message, we
> expect it to be followed up directly by the next message. So, here, we
> are directly expecting a new message to start, meaning the SYN should be
> found at the start of the buffer, or, closer to the code, aligned.ptr
> (the start of the message frame) should equal source->ptr. If this is
> not the case, this indicates that some unexpected bytes are in-between
> the last successfully parsed message and the next message. Usually
> that's caused by when a previous message has failed one of the CRC
> checks (thus we can't rely on the length encoded in the frame) and we're
> actively searching for the next message (via this call here).
> 
> Thanks for the report!
> 
> Do you want to submit a patch for this or should I do that?
> 

I think I understand, but can you send the patch for this.  Why not just
make the condition:

	if (aligned.ptr != source->ptr) {

Anyway, I assume you know what you're doing.  :)

regards,
dan carepnter
