From: Matthew Garrett <matthew.garrett@nebula.com>
Subject: Improve Apple GMUX support on switcheroo
Date: Sun,  1 Jun 2014 12:38:32 -0400
Message-ID: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:60018 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753120AbaFAQix (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 1 Jun 2014 12:38:53 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org

The Apple GMUX switcheroo code doesn't really work that well - there's no
straightforward way to ensure that drivers are loaded in the correct order,
and no mechanism to probe displays without performing a full switch. This
patchset adds infrastructural support to switcheroo and functionality to
GMUX in order to fix things up. This won't actually *work* in its current
form - it needs additional patches to the GPU drivers, which are currently
in a somewhat hacky state.

-- 
Matthew Garrett | matthew.garrett@nebula.com
