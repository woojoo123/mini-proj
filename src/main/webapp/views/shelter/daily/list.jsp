<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보호소 일상 | Shelter</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-light: #F1DEC9;
            --primary-dark: #3C2A21;
            --secondary-light: #FFF8EA;
            --accent: #A4907C;
            --text-dark: #000000;
            --text-gray: #777777;
            --bg-light: #F9F9F9;
        }
        
        body {
            background-color: var(--bg-light);
            color: var(--text-dark);
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        .content-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .content-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
        }
        
        .content-media {
            width: 100%;
            height: 400px;
            object-fit: cover;
        }
        
        .content-body {
            padding: 1.5rem;
        }
        
        .shelter-name {
            color: var(--accent);
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        
        .content-date {
            color: var(--text-gray);
            font-size: 0.9rem;
            margin-bottom: 0.5rem;
        }
        
        .content-title {
            font-size: 1.5rem;
            font-weight: 700;
            margin: 1rem 0;
            color: var(--primary-dark);
        }
        
        .content-description {
            color: var(--text-dark);
            line-height: 1.6;
            margin-bottom: 1.5rem;
        }
        
        .comment-btn {
            background: none;
            border: 1px solid var(--accent);
            color: var(--accent);
            padding: 0.5rem 1rem;
            border-radius: 20px;
            transition: all 0.3s ease;
        }

        .comment-btn:hover {
            background: var(--accent);
            color: white;
        }

        .like-btn {
            background: none;
            border: 1px solid #ff6b6b;
            color: #ff6b6b;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            transition: all 0.3s ease;
            margin-right: 0.5rem;
        }

        .like-btn:hover {
            background: #ff6b6b;
            color: white;
        }

        .like-btn.liked {
            background: #ff6b6b;
            color: white;
        }

        .shelter-profile {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 14px;
        }

        .comment-author-profile {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            margin-right: 0.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 12px;
        }

        .content-placeholder {
            width: 100%;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 18px;
            font-weight: 600;
        }

        .video-placeholder {
            width: 100%;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 18px;
            font-weight: 600;
            background-color: #e8f4f8;
        }

        .carousel-placeholder {
            width: 100%;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 18px;
            font-weight: 600;
        }
        
        .filter-section {
            background: white;
            padding: 1.5rem;
            border-radius: 12px;
            margin-bottom: 2rem;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }
        
        .filter-title {
            font-weight: 600;
            margin-bottom: 1rem;
            color: var(--primary-dark);
        }
        
        .form-select {
            border-color: var(--primary-light);
            padding: 0.5rem 1rem;
        }
        
        .form-select:focus {
            border-color: var(--accent);
            box-shadow: 0 0 0 0.25rem rgba(164, 144, 124, 0.25);
        }
        
        /* Comment Drawer */
        .comment-drawer {
            position: fixed;
            top: 0;
            right: -400px;
            width: 400px;
            height: 100%;
            background: white;
            box-shadow: -5px 0 15px rgba(0, 0, 0, 0.1);
            transition: right 0.3s ease;
            z-index: 1050;
            padding: 2rem;
            overflow-y: auto;
        }
        
        .comment-drawer.show {
            right: 0;
        }
        
        .comment-close {
            position: absolute;
            top: 1rem;
            right: 1rem;
            font-size: 1.5rem;
            background: none;
            border: none;
            cursor: pointer;
            color: var(--text-gray);
        }
        
        .comment-item {
            padding: 1rem 0;
            border-bottom: 1px solid #eee;
        }
        
        .comment-author {
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        
        .comment-text {
            margin-bottom: 0.5rem;
        }
        
        .comment-date {
            font-size: 0.8rem;
            color: var(--text-gray);
        }
        
        .comment-form {
            margin-top: 2rem;
            padding-top: 1.5rem;
            border-top: 1px solid #eee;
        }
        
        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1040;
        }
        
        .overlay.show {
            display: block;
        }
        
        @media (max-width: 768px) {
            .comment-drawer {
                width: 100%;
                right: -100%;
            }
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="row mb-4">
            <div class="col-12">
                <h1 class="fw-bold mb-4">보호소 일상</h1>
                <p class="text-muted">보호소의 소중한 일상을 공유합니다.</p>
            </div>
        </div>
        
        <!-- Content List -->
        <div class="row">
            <!-- Sample Content 1 -->
            <div class="col-12 mb-4">
                <div class="content-card">
                    <div class="content-placeholder" style="background-color: #f0f4f8;">
                        골든리트리버 사진
                    </div>
                    <div class="content-body">
                        <div class="d-flex justify-content-between align-items-start">
                            <div class="d-flex align-items-center">
                                <div class="shelter-profile" style="background-color: #a8d8ea;">
                                    행복
                                </div>
                                <div>
                                    <div class="shelter-name">행복한 강아지 보호소</div>
                                    <div class="content-date">2023년 11월 15일</div>
                                </div>
                            </div>
                            <div>
                                <span class="badge bg-light text-dark me-2">#골든리트리버</span>
                                <span class="badge bg-light text-dark">#입양가능</span>
                            </div>
                        </div>
                        <h2 class="content-title">새로 온 골든리트리버 루비를 소개합니다</h2>
                        <p class="content-description">
                            오늘 새로 보호소에 온 골든리트리버 루비입니다. 3살 암컷으로 매우 온순하고 사람을 좋아해요.
                            이전 주인과 헤어진 후 슬퍼했지만, 이제는 다시 활기를 되찾고 있습니다.
                            루비에게 평생 함께할 따뜻한 가족이 나타나기를 기다리고 있어요!
                        </p>
                        <div>
                            <button class="like-btn" onclick="toggleLike(1)">
                                <i class="far fa-heart me-2"></i>좋아요 (24)
                            </button>
                            <button class="comment-btn" onclick="openCommentDrawer(1)">
                                <i class="far fa-comment-dots me-2"></i>댓글 (12)
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Sample Content 2 -->
            <div class="col-12 mb-4">
                <div class="content-card">
                    <div class="video-placeholder">
                        치료 과정 영상
                    </div>
                    <div class="content-body">
                        <div class="d-flex justify-content-between align-items-start">
                            <div class="d-flex align-items-center">
                                <div class="shelter-profile" style="background-color: #ffaaa5;">
                                    사랑
                                </div>
                                <div>
                                    <div class="shelter-name">사랑으로 강아지병원</div>
                                    <div class="content-date">2023년 11월 14일</div>
                                </div>
                            </div>
                            <div>
                                <span class="badge bg-light text-dark me-2">#비글</span>
                                <span class="badge bg-light text-dark">#치료완료</span>
                            </div>
                        </div>
                        <h2 class="content-title">다리 부상에서 완전히 회복된 비글 초코</h2>
                        <p class="content-description">
                            지난 달 교통사고로 다리 부상을 입고 보호소에 들어온 비글 초코. 수술과 재활치료를 거쳐
                            이제는 완전히 회복되어 활발하게 뛰어다니고 있어요.
                            초코의 놀라운 회복 과정을 영상으로 담아봤습니다.
                        </p>
                        <div>
                            <button class="like-btn" onclick="toggleLike(2)">
                                <i class="far fa-heart me-2"></i>좋아요 (18)
                            </button>
                            <button class="comment-btn" onclick="openCommentDrawer(2)">
                                <i class="far fa-comment-dots me-2"></i>댓글 (8)
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Sample Content 3 -->
            <div class="col-12 mb-4">
                <div class="content-card">
                    <div class="carousel-placeholder" style="background-color: #d4e6f1;">
                        대형견 사진 갤러리
                    </div>
                    <div class="content-body">
                        <div class="d-flex justify-content-between align-items-start">
                            <div class="d-flex align-items-center">
                                <div class="shelter-profile" style="background-color: #b8d8ba;">
                                    푸른
                                </div>
                                <div>
                                    <div class="shelter-name">푸르른 강아지 보호센터</div>
                                    <div class="content-date">2023년 11월 12일</div>
                                </div>
                            </div>
                            <div>
                                <span class="badge bg-light text-dark me-2">#대형견</span>
                                <span class="badge bg-light text-dark">#입양대기</span>
                            </div>
                        </div>
                        <h2 class="content-title">사랑스러운 대형견 친구들을 소개합니다</h2>
                        <p class="content-description">
                            오늘은 특별히 보호하고 있는 대형견 친구들을 소개해드립니다.
                            래브라도, 골든리트리버, 저먼셰퍼드 등 다양한 대형견들이 새 가족을 기다리고 있어요.
                            대형견은 넓은 공간이 필요하지만, 그만큼 충성스럽고 사랑스러운 매력이 가득한 친구들이랍니다.
                        </p>
                        <div>
                            <button class="like-btn" onclick="toggleLike(3)">
                                <i class="far fa-heart me-2"></i>좋아요 (15)
                            </button>
                            <button class="comment-btn" onclick="openCommentDrawer(3)">
                                <i class="far fa-comment-dots me-2"></i>댓글 (5)
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Comment Drawer -->
    <div class="overlay" id="commentOverlay" onclick="closeCommentDrawer()"></div>
    <div class="comment-drawer" id="commentDrawer">
        <button class="comment-close" onclick="closeCommentDrawer()">&times;</button>
        <h4 class="mb-4">댓글</h4>
        
        <!-- Comment List -->
        <div id="commentList">
            <!-- Sample Comments -->
            <div class="comment-item">
                <div class="d-flex align-items-start">
                    <div class="comment-author-profile" style="background-color: #ffd6cc;">
                        홍
                    </div>
                    <div class="flex-grow-1">
                        <div class="comment-author">홍길동</div>
                        <div class="comment-text">루비 정말 예쁘네요! 다음 주에 방문해서 직접 만나보고 싶어요.</div>
                        <div class="comment-date">2023-11-15 14:30</div>
                    </div>
                </div>
            </div>
            <div class="comment-item">
                <div class="d-flex align-items-start">
                    <div class="comment-author-profile" style="background-color: #c8e6c9;">
                        김
                    </div>
                    <div class="flex-grow-1">
                        <div class="comment-author">김철수</div>
                        <div class="comment-text">저희 집 강아지도 여기서 입양했는데 너무 잘 지내고 있어요!</div>
                        <div class="comment-date">2023-11-15 12:45</div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Comment Form -->
        <div class="comment-form">
            <div class="mb-3">
                <label for="commentText" class="form-label">댓글 작성</label>
                <textarea class="form-control" id="commentText" rows="3" placeholder="댓글을 작성해주세요."></textarea>
            </div>
            <button class="btn" style="background-color: var(--accent); color: white;" onclick="addComment()">댓글 등록</button>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Comment Drawer Functions
        function openCommentDrawer(postId) {
            document.getElementById('commentDrawer').classList.add('show');
            document.getElementById('commentOverlay').classList.add('show');
            document.body.style.overflow = 'hidden';
            
            // Here you would typically load comments for the specific postId
            // For demo purposes, we're just showing the drawer
            console.log('Loading comments for post:', postId);
        }
        
        function closeCommentDrawer() {
            document.getElementById('commentDrawer').classList.remove('show');
            document.getElementById('commentOverlay').classList.remove('show');
            document.body.style.overflow = 'auto';
        }
        
        function addComment() {
            const commentText = document.getElementById('commentText').value.trim();
            if (!commentText) return;
            
            // In a real app, you would send this to your server
            const commentList = document.getElementById('commentList');
            const now = new Date();
            const dateStr = now.toISOString().split('T')[0];
            const timeStr = now.toTimeString().substring(0, 5);
            
            const newComment = document.createElement('div');
            newComment.className = 'comment-item';
            newComment.innerHTML = `
                <div class="comment-author">사용자</div>
                <div class="comment-text">${commentText}</div>
                <div class="comment-date">${dateStr} ${timeStr}</div>
            `;
            
            commentList.insertBefore(newComment, commentList.firstChild);
            document.getElementById('commentText').value = '';
            
            // Scroll to the new comment
            newComment.scrollIntoView({ behavior: 'smooth' });
        }
        
        // Handle Enter key in comment textarea
        document.getElementById('commentText').addEventListener('keypress', function(e) {
            if (e.key === 'Enter' && !e.shiftKey) {
                e.preventDefault();
                addComment();
            }
        });
        
        // Close drawer when clicking outside
        document.getElementById('commentOverlay').addEventListener('click', function(e) {
            if (e.target === this) {
                closeCommentDrawer();
            }
        });
        
        // Like functionality
        function toggleLike(postId) {
            const likeBtn = event.target.closest('.like-btn');
            const icon = likeBtn.querySelector('i');
            const text = likeBtn.childNodes[likeBtn.childNodes.length - 1];

            if (likeBtn.classList.contains('liked')) {
                likeBtn.classList.remove('liked');
                icon.classList.remove('fas');
                icon.classList.add('far');
                // Decrease like count (demo)
                const currentCount = parseInt(text.textContent.match(/\d+/)[0]);
                text.textContent = ` 좋아요 (${currentCount - 1})`;
            } else {
                likeBtn.classList.add('liked');
                icon.classList.remove('far');
                icon.classList.add('fas');
                // Increase like count (demo)
                const currentCount = parseInt(text.textContent.match(/\d+/)[0]);
                text.textContent = ` 좋아요 (${currentCount + 1})`;
            }
        }
    </script>
</body>
</html>
