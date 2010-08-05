From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/5] Convert x86 platform drivers to use sparse keymap library
Date: Wed, 04 Aug 2010 22:29:52 -0700
Message-ID: <20100805052645.604.28606.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:40792 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751662Ab0HEF34 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 5 Aug 2010 01:29:56 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, mjg@redhat.com

The following patch series converts several platform drivers that
employed their private implementation of sparse keymap to use
sparse-keymap library to reduce code duplication.

Please consider applying.

Thanks.

-- 
Dmitry
